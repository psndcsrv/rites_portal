namespace :rites_portal do
  namespace :dev do
    
    desc 'Load db with imaginary data for development use'
    task :load_mock_up_data => :environment do
      MockupDataLoader.new.load
    end
    
  end
end
