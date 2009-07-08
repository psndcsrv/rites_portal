class MockupDataLoader
  
  def initialize
    yaml_dir = File.join(File.dirname(__FILE__), '..', 'test', 'fixtures')
    @users_path = File.join(yaml_dir, 'users.yml')
    @grade_levels_path = File.join(yaml_dir, 'rites_portal_grade_levels.yml')
    @students_path = File.join(yaml_dir, 'rites_portal_students.yml')
    @teachers_path = File.join(yaml_dir, 'rites_portal_teachers.yml')
    @districts_path = File.join(yaml_dir, 'rites_portal_districts.yml')
    @schools_path = File.join(yaml_dir, 'rites_portal_schools.yml')
    @semesters_path = File.join(yaml_dir, 'rites_portal_semesters.yml')
    @courses_path = File.join(yaml_dir, 'rites_portal_courses.yml')
    @classes_path = File.join(yaml_dir, 'rites_portal_clazzes.yml')
    @offerings_path = File.join(yaml_dir, 'rites_portal_offerings.yml')
    @learners_path = File.join(yaml_dir, 'rites_portal_learners.yml')
  end
  
  def load
    roles = load_roles
    process_roles(roles)
    
    users = load_from_yaml(@users_path, User)
    process_users(users, roles)
    
    grade_levels = load_from_yaml(@grade_levels_path, RitesPortal::GradeLevel)
    process_grade_levels(grade_levels)
    
    investigations = load_investigations
    process_investigations(investigations, users)

    students = load_from_yaml(@students_path, RitesPortal::Student)    
    process_students(students, users, grade_levels)
    
    teachers = load_from_yaml(@teachers_path, RitesPortal::Teacher)    
    process_teachers(teachers, users)
    
    districts = load_from_yaml(@districts_path, RitesPortal::District)    
    process_districts(districts)
    
    schools = load_from_yaml(@schools_path, RitesPortal::School)    
    process_schools(schools, districts)
    
    semesters = load_from_yaml(@semesters_path, RitesPortal::Semester)
    process_semesters(semesters, schools)
        
    courses = load_from_yaml(@courses_path, RitesPortal::Course)
    process_courses(courses, schools)
    
    classes = load_from_yaml(@classes_path, RitesPortal::Clazz)
    process_classes(classes, courses, semesters, teachers)
    
    offerings = load_from_yaml(@offerings_path, RitesPortal::Offering)
    process_offerings(offerings, classes, investigations)
    
    learners = load_from_yaml(@learners_path, RitesPortal::Learner)
    process_learners(learners, students, offerings)
  end
  
private

  def load_from_yaml(yml_path, model)
    records = {}
    model.delete_all
    yaml = YAML.load_file(yml_path)
    yaml.each do |name, attributes|
      records[name] = model.new(attributes)
    end
    records
  end
  
  def process_users(users, roles)
    students = ['marcus', 'paul', 'maria', 'thomas']
    students.each do |key|
      users[key].roles << roles['student']
    end
    teachers = ['grigory', 'john', 'homer']
    teachers.each do |key|
      users[key].roles << roles['teacher']
    end
    users.values.each do |user|
      user.register
      user.activate
      user.save!  
    end
  end
  
  def process_students(students, users, grade_levels)
    students.each do |key, student|
      student.user = users[key]
    end 
    students['marcus'].grade_level = grade_levels['g_8']
    students['paul'].grade_level = grade_levels['g_8']
    students['maria'].grade_level = grade_levels['g_2']
    students['thomas'].grade_level = grade_levels['g_2']
    students.values.each { |s| s.save! }
  end
  
  def process_teachers(teachers, users)
    teachers.each do |key, teacher|
      teacher.user = users[key]
    end 
  end    
  
  def process_districts(districts)
    districts.values.each { |d| d.save! }
  end
  
  def process_schools(schools, districts)
    schools['hogwarts'].district = districts['tzone']
    schools.values.each { |school| school.save! }
  end
  
  def process_semesters(semesters, schools)
    semesters['hogwarts_fall_2009'].school = schools['hogwarts']
    semesters.values.each { |sem| sem.save! }
  end
  
  def process_courses(courses, schools)
    courses['electronics_1'].school = schools['hogwarts']
    courses['biology_1'].school = schools['hogwarts']
    courses.values.each { |course| course.save! }
  end
  
  def process_classes(classes, courses, semesters, teachers)
    classes['electronics_1_1'].course = courses['electronics_1']
    classes['electronics_1_1'].teacher = teachers['grigory']
    classes['electronics_1_1'].semester = semesters['hogwarts_fall_2009']
    classes['biology_1_1'].course = courses['biology_1']
    classes['biology_1_1'].teacher = teachers['homer']
    classes['biology_1_1'].semester = semesters['hogwarts_fall_2009']
    classes.values.each { |c| c.save! }
  end
  
  def process_learners(learners, students, offerings)
    learners['marcus_circuit_1'].student = students['marcus']
    learners['marcus_circuit_1'].offering = offerings['circuit_1'] 
    learners['paul_circuit_1'].student = students['paul']
    learners['paul_circuit_1'].offering = offerings['circuit_1']
    learners.values.each { |learner| learner.save! }
  end
  
  def process_offerings(offerings, classes, investigations)
    offerings['circuit_1'].runnable = investigations['plant_1']
    offerings['circuit_1'].clazz = classes['electronics_1_1']
    offerings['plant_1'].runnable = investigations['plant_1']
    offerings['plant_1'].clazz = classes['biology_1_1']
    offerings.values.each { |offering| offering.save! }
  end    
  
  def load_roles
    roles = {}
    roles['admin'] = Role.new(:title => 'admin',
                              :position => 1,
                              :uuid => 'BB613D6F-3E07-4CA3-ACE6-FC486F001115')
    roles['manager'] = Role.new(:title => 'manager',
                                :position => 2,
                                :uuid => 'FE9471B0-DCC6-4303-BBD8-1C52C24B0DDD')
    roles['researcher'] = Role.new(:title => 'researcher',
                                   :position => 3,
                                   :uuid => '50AAA10A-8196-4F30-9547-7B9123C59C4D')
    roles['teacher'] = Role.new(:title => 'teacher',
                                :position => 4,
                                :uuid => '3346D5EB-9AD6-4B04-BF1C-49C7DF877A0D')
    roles['author'] = Role.new(:title => 'author',
                               :position => 5,
                               :uuid => 'B1B6BA44-8F4B-41FF-8A23-AC1A476344FB')
    roles['member'] = Role.new(:title => 'member',
                               :position => 6,
                               :uuid => 'D95EE77A-9188-4573-9FD0-4EA4DDC924DE')
    roles['student'] = Role.new(:title => 'student',
                                :position => 7,
                                :uuid => '90D1587C-7B5C-47EF-964D-64C5CA7A9519')
    roles['guest'] = Role.new(:title => 'guest',
                              :position => 8,
                              :uuid => 'AB3A340F-2DDC-413A-B1AC-D282FEE0B42E')                        
    roles
  end
  
  def process_roles(roles)
    roles.values.each { |role| role.save! }
  end
  
  def process_grade_levels(grade_levels)
    grade_levels.values.each { |level| level.save! }
  end

  def load_investigations
    invs = {}
    invs['plant_1'] = Investigation.new(
      :uuid => '6600B1CF-7B6D-4A5B-9498-11BB63764768',
      :name => 'Das Investigation',
      :description => 'Case of Benjamin Button',
      #:grade_span_expectation_id => 1,
      :teacher_only => false)
    invs
  end
  
  def process_investigations(invs, users)
    invs['plant_1'].user = users['grigory']
    invs.values.each { |inv| inv.save! }
  end
  
end
