class Portal::District < ActiveRecord::Base
  set_table_name :portal_districts
  
  acts_as_replicatable
  
  has_many :schools, :class_name => "Portal::School", :foreign_key => "district_id"
  belongs_to :nces_district, :class_name => "Portal::Nces06District", :foreign_key => "nces_district_id"

end