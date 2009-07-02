class RitesPortal::GradeLevel < ActiveRecord::Base
  set_table_name :rites_portal_grade_levels
  
  belongs_to :school, :class_name => "RitesPortal::School", :foreign_key => "school_id"
  
  has_many :students, :class_name => "RitesPortal::Student", :foreign_key => "grade_level_id"
  
  has_and_belongs_to_many :teachers, :join_table => "rites_portal_grade_levels_teachers", :class_name => "RitesPortal::Teacher"
  has_and_belongs_to_many :courses, :join_table => "rites_portal_courses_grade_levels", :class_name => "RitesPortal::Course"
end