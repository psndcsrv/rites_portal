class Portal::Teacher < ActiveRecord::Base
  set_table_name :portal_teachers
  
  acts_as_replicatable
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  # because of has many polymorphs, we don't need the following relationships defined
  # has_many :school_memberships
  # has_many :schools, :through => :school_memberships
  
  has_many :subjects, :class_name => "Portal::Subject", :foreign_key => "teacher_id"
  has_many :clazzes, :class_name => "Portal::Clazz", :foreign_key => "teacher_id"
  
  has_and_belongs_to_many :grade_levels, :join_table => "portal_grade_levels_teachers", :class_name => "Portal::GradeLevel"
  
  [:name, :first_name, :last_name, :email, :vendor_interface].each { |m| delegate m, :to => :user }
end