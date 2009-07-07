class RitesPortal::Nces06School < ActiveRecord::Base
  set_table_name :rites_portal_nces06_schools
  
  belongs_to :nces_district, :class_name => "RitesPortal::Nces06District", :foreign_key => "nces_district_id"
end
