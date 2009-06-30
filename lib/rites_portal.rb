# RitesPortal
module RitesPortal
  @@models = [
    RitesPortal::Course,
#    RitesPortal::Semester,
#    RitesPortal::Clazz,
#    RitesPortal::SchoolMembership,
#    RitesPortal::TeacherGradeLevel,
#    RitesPortal::Subject,
#    RitesPortal::GradeLevel,
#    RitesPortal::School,
#    RitesPortal::TeacherClazz,
#    RitesPortal::StudentClazz,
#    RitesPortal::Member,
#    RitesPortal::Offering,
#    RitesPortal::Learner,
#    RitesPortal::District,
#    RitesPortal::GrantProject,
    ]
  def self.configure_connections(configuration)
    @@models.each do |m|
      m.establish_connection(configuration)
    end
  end
end