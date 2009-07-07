class RitesPortal::SdsConfig < ActiveRecord::Base
  acts_as_replicatable
  
  belongs_to :configurable, :polymorphic => true
end
