class RitesPortal::District < ActiveRecord::Base
  set_table_name :rites_portal_districts
  
  has_many :schools, :class_name => "RitesPortal::School", :foreign_key => "district_id"
  belongs_to :nces_district, :class_name => "RitesPortal::Nces06District", :foreign_key => "nces_district_id"

end