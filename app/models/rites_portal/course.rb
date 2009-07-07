class RitesPortal::Course < ActiveRecord::Base
  set_table_name :rites_portal_courses
  
  acts_as_replicatable
  
  belongs_to :school, :class_name => "RitesPortal::School", :foreign_key => "school_id"
  
  has_many :clazzes, :class_name => "RitesPortal::Clazz", :foreign_key => "course_id"
  has_and_belongs_to_many :grade_levels, :join_table => "rites_portal_courses_grade_levels", :class_name => "RitesPortal::GradeLevel"
end