class RitesPortal::Offering < ActiveRecord::Base
  set_table_name :rites_portal_offerings
  
  acts_as_replicatable
  
  has_one :sds_config, :class_name => "RitesPortal::SdsConfig", :as => :configurable
  
  belongs_to :clazz, :class_name => "RitesPortal::Clazz", :foreign_key => "clazz_id"
  belongs_to :runnable, :polymorphic => true
  
  has_many :learners, :class_name => "RitesPortal::Learner", :foreign_key => "offering_id"
  
  ###################################################
  ### SDS Specific code
  ###################################################
  after_create :create_sds_counterpart
  
  # Find or creates a learner for this sds runnable object
  # and for the specified user.
  def create_sds_counterpart
    self.create_sds_config(:sds_id => RitesPortal::SdsConnect::Connect.create_offering(self.runnable.name, RitesPortal::SdsConnect::Connect.jnlp_id, RitesPortal::SdsConnect::Connect.curnit_id))
  end
  
  ###################################################
  ### End SDS Specific code
  ###################################################
end