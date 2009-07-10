class RitesPortal::StudentClazz < ActiveRecord::Base
  set_table_name :rites_portal_student_clazzes
  
  acts_as_replicatable
  
  belongs_to :clazz, :class_name => "RitesPortal::Clazz", :foreign_key => "clazz_id"
  belongs_to :student, :class_name => "RitesPortal::Student", :foreign_key => "student_id"
  
  [:name, :description].each { |m| delegate m, :to => :clazz }

end