require 'uuidtools'

class MockupDataLoader
  
  @@yaml_dir = File.join(File.dirname(__FILE__), '..', 'test', 'fixtures')
  
  def load(table_name)
    yaml_hash = YAML.load_file(File.join(@@yaml_dir, "rites_portal_#{table_name}.yml"))
    model_class = "RitesPortal::#{table_name.singularize.camelcase}".constantize
    ActiveRecord::Base.connection.delete("TRUNCATE `rites_portal_#{table_name}`")
    yaml_hash.values.each do |attributes|
      attributes[:uuid] = UUIDTools::UUID.timestamp_create.to_s
      c = model_class.new
      c.attributes = attributes
      c.save!
    end
  end
  
end
