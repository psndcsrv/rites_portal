namespace :portal do
  namespace :fixups do
    desc "Establish SDS counterparts for all models that need it"
    task :create_sds_counterparts => :environment do
      [User, Portal::Learner, Portal::Offering].each do |klass|
        klass.all.each do |u|
          if (! u.sds_config) || (! u.sds_config.sds_id)
            u.create_sds_counterpart
          end
        end
      end
    end
  end
end