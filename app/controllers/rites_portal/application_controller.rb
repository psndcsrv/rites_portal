class RitesPortal::ApplicationController < ActionController::Base
  layout 'rites_portal_standard'
  
  def self.active_scaffold_controller_for(klass)
    
    # if a model class doesn't have a module then it is part of the containing
    # app and we assume it has a module of Admin
    if not /::/ === klass.to_s()
       return internal_active_scaffold_controller_for(klass, klass.to_s(), "Admin::")
    end

    super  
  end
  
end