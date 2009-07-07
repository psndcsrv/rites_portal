class RitesPortal::SdsConfig < ActiveRecord::Base
  set_table_name :rites_portal_sds_configs
  
  belongs_to :configurable, :polymorphic => true
end
