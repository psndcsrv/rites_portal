namespace :rites_portal do
  namespace :dev do
    
    desc 'Load db with imaginary data for development use'
    task :load_mockup_data => :environment do
      MockupDataLoader.new.load
    end
    
  end
end
