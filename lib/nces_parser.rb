class NcesParser
  
  def initialize(district_layout_file, school_layout_file, year)
    ## @year_str gets inserted to the db table names
    @year_str = year.to_s[-2..-1]
      
    puts 'Parsing layout files ...'
    ## layouts are an array of arrays
    ## [ [c1, s1, e1, l1, t1], [c2, s2, e2, l2, t2], ...] where
    ## cn: column code (e.g. NCESSCH)
    ## sn: start pos
    ## en: end pos
    ## ln: field length
    ## tn: data type
    @district_layout = _get_layout(district_layout_file)
    puts "#{@district_layout.size} variables retrieved from #{district_layout_file}"
    @school_layout = _get_layout(school_layout_file)
    puts "#{@school_layout.size} variables retrieved from #{school_layout_file}"
    
    @district_model = RitesPortal.const_get("Nces#{@year_str}District")
    @school_model = RitesPortal.const_get("Nces#{@year_str}School")
    @district_foreign_key = "nces#{@year_str}_district_id"
  end
  
  def create_migration(target_dir)
    migration = NcesMigrationGenerator.new(@district_layout, @school_layout, @year_str)
    migration.write(target_dir)
  end
  
  def load_db(district_data_files, school_data_files)
    ## Delete all the entries first
    @district_model.delete_all
    @school_model.delete_all
    
    ## District data must be loaded prior to school data
    ## because school data parsing needs to query the district table
    print 'Loading district data '
    district_data_files.each do |fpath|
      open(fpath) do |file|
        _parse_file(file, @district_layout, @district_model, false)
      end
    end
    
    print 'Loading school data '
    school_data_files.each do |fpath|
      open(fpath) do |file|
        _parse_file(file, @school_layout, @school_model, true)
      end
    end
  end
  
private

  def _get_layout(layout_file)
    columns = []
    open(layout_file) do |file|
      cnt = 0
      line = ''
      while (line = file.gets) && cnt < 2 do #fast forward until real data begins
        cnt += 1 if line =~ /=====/
      end
      while line do
        unless line =~ /\A\s/
          columns << _parse_column_def_line(line.strip)
        end
        line = file.gets
      end
    end
    columns
  end
  
  def _parse_column_def_line(line)
    tokens = line.split(/\s+/)
    ## Strip '+' prefix and year label suffix
    tokens[0] = tokens[0].sub(/\+?(.+?)([0-9]{2})?\z/, '\1')
    ## column 0: variable name
    ## column 1: start pos
    ## column 2: end pos
    ## column 3: field length with an optional modifier '*'
    ## column 4: data type (AN or N)
    [tokens[0].intern, tokens[1].to_i, tokens[2].to_i, tokens[3], tokens[4]]
  end

  def _parse_file(file, layout, model, is_school_file)
    attributes = {}
    cnt = 0
    while (line = file.gets) do
      next if line.strip == ''
      attributes.clear
      layout.each do |label, start_pos, end_pos, data_type|
        data_str = line[(start_pos-1)..(end_pos-1)].strip.gsub(/[^[:print:]]/, '')
        data_value = data_type == 'N' ? data_str.to_i : data_str
        attributes[label] = data_value
      end
      if is_school_file
        district = @district_model.find(:conditions => { LEAID => attributes[:LEAID] })
        if district
          attributes[@district_foreign_key.intern] = district.id
        else
          puts 'ERROR: cannot find district for ' + attributes[:SCHNAM]
          attributes[@district_foreign_key.intern] = nil
        end
      end
      rec = model.new(attributes)
      rec.save!
      cnt += 1
      putc('.') if cnt % 100 == 0
    end
    puts "\n#{cnt} records saved from #{file.path}"
  end
  
end

class NcesMigrationGenerator
  
  def initialize(district_layout, school_layout, year_str)
    @district_layout = district_layout
    @school_layout = school_layout
    @text = ''
    @migration_file_name = "create_nces#{year_str}_tables.rb"
    @migration_class_name = "CreateNces#{year_str}Tables"
    @district_db_name = "nces#{year_str}_districts"
    @school_db_name = "nces#{year_str}_schools"
    @district_foreign_key = "nces#{year_str}_district_id"
  end
  
  def write(target_dir)
    open(File.join(target_dir, _get_file_name), 'w') do |f|
      f.write(_getText)
    end
  end
  
private  

  def _get_file_name
    Time.now.gmtime.strftime('%Y%m%d%H%M%S') + '_' + @migration_file_name
  end
  
  def _getText
    @text << "class #{@migration_class_name} < ActiveRecord::Migration\n\n"
    @text << "  def self.up\n"
    @text << "    create_table :#{@district_db_name} do |t|\n"
    @text << _getFieldsText(@district_layout)
    @text << "    end\n\n"
    @text << "    create_table :#{@school_db_name} do |t|\n"
    @text << "      t.integer :#{@district_foreign_key}\n"
    @text << _getFieldsText(@school_layout)
    @text << "    end\n"
    @text << _addIndexText
    @text << "  end\n\n"
    @text << "  def self.down\n"
    @text << "    drop_table :#{@district_db_name}\n"
    @text << "    drop_table :#{@school_db_name}\n"
    @text << _removeIndexText
    @text << "  end\n\n"
    @text << "end\n"
  end
  
  def _getFieldsText(layout)
    text = ''
    indent = ' ' * 6
    layout.each do |label, start_pos, end_pos, field_len, data_type|
      text << indent
      if field_len =~ /\*\z/
        text << "t.float :#{label}\n"
      elsif data_type == 'N'
        text << "t.integer :#{label}\n"
      else
        text << "t.string :#{label}, :limit => #{field_len.sub(/\*\z/, '')}\n"
      end
    end
    text
  end
  
  def _addIndexText
    %q{
    add_index :nces06_districts, :LEAID
    add_index :nces06_districts, :STID
    add_index :nces06_districts, :NAME
    
    add_index :nces06_schools, :SCHNO 
    add_index :nces06_schools, :STID
    add_index :nces06_schools, :SCHNAM
}
  end
  
  def _removeIndexText
    %q{
    remove_index :nces06_districts, :LEAID
    remove_index :nces06_districts, :STID
    remove_index :nces06_districts, :NAME
    
    remove_index :nces06_schools, :SCHNO 
    remove_index :nces06_schools, :STID
    remove_index :nces06_schools, :SCHNAM
}
  end

end
