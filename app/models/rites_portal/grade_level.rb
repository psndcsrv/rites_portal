class RitesPortal::GradeLevel < ActiveRecord::Base
  set_table_name :rites_portal_grade_levels
  
  belongs_to :school, :class_name => "RitesPortal::School", :foreign_key => "school_id"
  
  has_many :students, :class_name => "RitesPortal::Student", :foreign_key => "grade_level_id"
  has_and_belongs_to_many :teachers, :foreign_key => "teacher_id"
end