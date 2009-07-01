class RitesPortal::Course < ActiveRecord::Base
  set_table_name :rites_portal_courses
  
  belongs_to :school, :class_name => "RitesPortal::School", :foreign_key => "school_id"
  
  has_many :clazzes, :class_name => "RitesPortal::Clazz", :foreign_key => "course_id"
end