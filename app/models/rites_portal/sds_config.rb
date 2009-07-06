class RitesPortal::SdsConfig < ActiveRecord::Base
  belongs_to :configurable, :polymorphic => true
end
