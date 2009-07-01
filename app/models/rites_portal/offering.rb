class RitesPortal::Offering < ActiveRecord::Base
  set_table_name :rites_portal_offerings
  
  belongs_to :clazz, :class_name => "RitesPortal::Clazz", :foreign_key => "clazz_id"
  belongs_to :runnable, :polymorphic => true
  
  has_many :learners, :class_name => "RitesPortal::Learner", :foreign_key => "offering_id"
end