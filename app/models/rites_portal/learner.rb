class RitesPortal::Learner < ActiveRecord::Base
  set_table_name :rites_portal_learners
  
  has_one :sds_config, :class_name => "RitesPortal::SdsConfig", :as => :configurable
  
  belongs_to :student, :class_name => "RitesPortal::Student", :foreign_key => "student_id"
  belongs_to :offering, :class_name => "RitesPortal::Offering", :foreign_key => "offering_id"
  
end