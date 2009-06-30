ActionController::Routing::Routes.draw do |map|
  map.namespace(:rites_portal) do |rites_portal|
    rites_portal.resources :courses
  end
  
end