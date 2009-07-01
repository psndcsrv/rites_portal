class RitesPortal::School < ActiveRecord::Base
  set_table_name :rites_portal_schools
  
  belongs_to :district, :class_name => "RitesPortal::District", :foreign_key => "district_id"
  
  has_many :courses, :class_name => "RitesPortal::Course", :foreign_key => "school_id"
  has_many :semesters, :class_name => "RitesPortal::Semester", :foreign_key => "school_id"
  has_many :grade_levels, :class_name => "RitesPortal::GradeLevel", :foreign_key => "school_id"
  
  has_many_polymorphs :members, :from => [:teachers, :students], :through => :school_memberships, :class_name => "RitesPortal::SchoolMembership", :foreign_key => "school_id"
end