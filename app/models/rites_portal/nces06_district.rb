class RitesPortal::Nces06District < ActiveRecord::Base
  set_table_name :rites_portal_nces06_districts
  
  acts_as_replicatable
  
  has_many :nces_schools, :class_name => "RitesPortal::Nces06School", :foreign_key => "nces_district_id"
end
