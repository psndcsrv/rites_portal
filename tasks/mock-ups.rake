namespace :rites_portal do
  namespace :dev do
    
    desc 'Load db with imaginary data for development use'
    task :load_mock_up_data => :environment do
      table_names = %w{ districts courses clazzes teachers students
        student_clazzes 
      }
      loader = MockupDataLoader.new
      table_names.each do |table_name|
        loader.load(table_name)
      end
    end
    
  end
end
