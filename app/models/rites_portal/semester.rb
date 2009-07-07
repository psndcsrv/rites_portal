class RitesPortal::Semester < ActiveRecord::Base
  set_table_name :rites_portal_semesters
  
  acts_as_replicatable
  
  belongs_to :school, :class_name => "RitesPortal::School", :foreign_key => "school_id"
  
  has_many :clazzes, :class_name => "RitesPortal::Clazz", :foreign_key => "semester_id"
end