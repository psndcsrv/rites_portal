class RitesPortal::Student < ActiveRecord::Base
  set_table_name :rites_portal_students
  
  # FIXME This should get moved to User once User gets moved into the portal
  has_one :sds_config, :class_name => "RitesPortal::SdsConfig", :as => :configurable
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :grade_level, :class_name => "RitesPortal::GradeLevel", :foreign_key => "grade_level_id"
  
  # because of has_many_polymorphs, we don't need the following relationships defined
  # has_many :school_memberships
  # has_many :schools, :through => :school_memberships
  
  has_many :learners, :class_name => "RitesPortal::Learner", :foreign_key => "student_id"
  has_many :student_clazzes, :class_name => "RitesPortal::StudentClazz", :foreign_key => "student_id"
  
  has_many :clazzes, :through => :student_clazzes, :class_name => "RitesPortal::Clazz"
end