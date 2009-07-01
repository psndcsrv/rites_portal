class RitesPortal::Teacher < ActiveRecord::Base
  set_table_name :rites_portal_teachers
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  has_many :subjects, :class_name => "RitesPortal::Subject", :foreign_key => "teacher_id"
  has_many :clazzes, :class_name => "RitesPortal::Clazz", :foreign_key => "teacher_id"
  
  has_and_belongs_to_many :grade_levels, :class_name => "RitesPortal::GradeLevel"
end