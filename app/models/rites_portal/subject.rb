class RitesPortal::Subject < ActiveRecord::Base
  set_table_name :rites_portal_subjects
  
  acts_as_replicatable
  
  belongs_to :teacher, :class_name => "RitesPortal::Teacher", :foreign_key => "teacher_id"
end