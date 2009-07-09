class RitesPortal::Student < ActiveRecord::Base
  set_table_name :rites_portal_students
  
  acts_as_replicatable
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :grade_level, :class_name => "RitesPortal::GradeLevel", :foreign_key => "grade_level_id"
  
  # because of has many polymorphs, we don't need the following relationships defined
  # has_many :school_memberships
  # has_many :schools, :through => :school_memberships
  
  has_many :learners, :class_name => "RitesPortal::Learner", :foreign_key => "student_id"
  has_many :student_clazzes, :class_name => "RitesPortal::StudentClazz", :foreign_key => "student_id"
  
  has_many :clazzes, :through => :student_clazzes, :class_name => "RitesPortal::Clazz"
  
  [:name, :first_name, :last_name, :email, :vendor_interface].each { |m| delegate m, :to => :user }
  
  def self.generate_user_email
    hash = UUIDTools::UUID.timestamp_create.to_s
    "no-email-#{hash}@concord.org"
  end
  
  def self.generate_user_login(first_name, last_name)
    generated_login = "#{first_name.downcase.gsub(/[^a-z0-9]/,'')}#{last_name[0..0].downcase}"
    existing_users = User.find(:all, :conditions => "login RLIKE '#{generated_login}[0-9]*$'", :order => :login)
    if existing_users.size > 0
      generated_login << "#{existing_users.size + 1}"
    end
    return generated_login
  end
end