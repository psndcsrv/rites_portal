class RitesPortal::Learner < ActiveRecord::Base
  set_table_name :rites_portal_learners
  
  acts_as_replicatable
  
  has_one :sds_config, :class_name => "RitesPortal::SdsConfig", :as => :configurable
  
  belongs_to :student, :class_name => "RitesPortal::Student", :foreign_key => "student_id"
  belongs_to :offering, :class_name => "RitesPortal::Offering", :foreign_key => "offering_id"
  
  ###################################################
  ### SDS Specific code
  ###################################################
  after_create :create_sds_counterpart
  
  # Find or creates a learner for this sds runnable object
  # and for the specified user.
  def create_sds_counterpart
    self.create_sds_config(:sds_id => RitesPortal::SdsConnect::Connect.create_workgroup(self.student.user.name, self.offering.sds_config.sds_id))
  end
  
  ###################################################
  ### End SDS Specific code
  ###################################################
  
end