class RitesPortal::Scaffold::ClazzesController < RitesPortal::ApplicationController
  active_scaffold "RitesPortal::Clazz" do |config|
    # this was causing problems because active scaffold is looking for a student_id on the students.  
    config.columns.exclude :students
  end
end