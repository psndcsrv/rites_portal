ActionController::Routing::Routes.draw do |map|
  map.namespace(:rites_portal) do |rites_portal|
    rites_portal.resources :clazzes
    rites_portal.resources :courses
    rites_portal.resources :districts
    rites_portal.resources :grade_levels
    rites_portal.resources :learners
    rites_portal.resources :offerings
    rites_portal.resources :schools
    rites_portal.resources :school_memberships
    rites_portal.resources :semesters
    rites_portal.resources :students
    rites_portal.resources :student_clazzes
    rites_portal.resources :subjects
    rites_portal.resources :teachers
  end
  
end