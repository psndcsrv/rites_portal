class RitesPortal::Clazz < ActiveRecord::Base
  set_table_name :rites_portal_clazzes
  belongs_to :course, :class_name => "RitesPortal::Course", :foreign_key => "course_id"
  belongs_to :semester, :class_name => "RitesPortal::Semester", :foreign_key => "semester_id"
  belongs_to :teacher, :class_name => "RitesPortal::Teacher", :foreign_key => "teacher_id"
  
  has_many :offerings, :class_name => "RitesPortal::Offering", :foreign_key => "clazz_id"
  has_many :student_clazzes, :class_name => "RitesPortal::StudentClazz", :foreign_key => "clazz_id"
  
  has_many :students, :through => :student_clazzes, :class_name => "RitesPortal::Student"
end