ActionController::Routing::Routes.draw do |map|
  map.namespace(:rites_portal) do |rites_portal|
    rites_portal.resources :clazzes, :active_scaffold => true 
    rites_portal.resources :courses, :active_scaffold => true 
    rites_portal.resources :districts, :active_scaffold => true 
    rites_portal.resources :grade_levels, :active_scaffold => true 
    rites_portal.resources :learners, :active_scaffold => true 
    rites_portal.resources :offerings, :active_scaffold => true 
    rites_portal.resources :schools, :active_scaffold => true 
    rites_portal.resources :school_memberships, :active_scaffold => true 
    rites_portal.resources :semesters, :active_scaffold => true 
    rites_portal.resources :students, :active_scaffold => true 
    rites_portal.resources :student_clazzes, :active_scaffold => true 
    rites_portal.resources :subjects, :active_scaffold => true 
    rites_portal.resources :teachers, :active_scaffold => true 
  end
  
end