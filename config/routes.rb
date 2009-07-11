ActionController::Routing::Routes.draw do |map|
  map.namespace(:portal) do |portal|
    portal.namespace(:scaffold) do |scaff|
      scaff.resources :clazzes, :active_scaffold => true 
      scaff.resources :courses, :active_scaffold => true 
      scaff.resources :districts, :active_scaffold => true 
      scaff.resources :grade_levels, :active_scaffold => true 
      scaff.resources :learners, :active_scaffold => true 
      scaff.resources :offerings, :active_scaffold => true 
      scaff.resources :schools, :active_scaffold => true 
      scaff.resources :school_memberships, :active_scaffold => true 
      scaff.resources :semesters, :active_scaffold => true 
      scaff.resources :students, :active_scaffold => true 
      scaff.resources :student_clazzes, :active_scaffold => true 
      scaff.resources :subjects, :active_scaffold => true 
      scaff.resources :teachers, :active_scaffold => true
    end
    portal.resources :clazzes, :as => 'classes', :member => {
        :add_offering => [:get,:post],
        :remove_offering => [:get, :post],
        :edit_offerings => [:get,:post]
    } 
    portal.resources :courses
    portal.resources :districts
    portal.resources :grade_levels
    portal.resources :learners
    portal.resources :offerings
    portal.resources :schools
    portal.resources :school_memberships
    portal.resources :semesters
    portal.resources :students, :collection => {
      :signup => [:get]
    }
    portal.resources :student_clazzes, :as => 'student_classes'
    portal.resources :subjects
    portal.resources :teachers
    
    portal.home 'readme', :controller => 'home', :action => 'readme'
    
  end
  
  # Restful Authentication Rewrites
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.change_password '/change_password/:reset_code', :controller => 'passwords', :action => 'reset'
  map.open_id_complete '/opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create '/opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }

  # Restful Authentication Resources
  map.resources :users, :member => { 
    :preferences => [:get, :put], 
    :switch => [:get, :put], 
    :interface => :get,
    :suspend   => :put,
    :unsuspend => :put,
    :purge     => :delete }
    
  map.resources :passwords
  map.resource :session
  
end