class RitesPortal::SchoolMembership < ActiveRecord::Base
  set_table_name :rites_portal_school_memberships
  
  acts_as_replicatable
  
  belongs_to :school, :class_name => "RitesPortal::School", :foreign_key => "school_id"
  belongs_to :member, :polymorphic => true
end