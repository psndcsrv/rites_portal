class RitesPortal::District < ActiveRecord::Base
  set_table_name :rites_portal_districts
  
  has_many :schools, :class_name => "RitesPortal::School", :foreign_key => "district_id"
end