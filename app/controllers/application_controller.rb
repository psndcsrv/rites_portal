class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
  
  helper :all # include all helpers, all the time
  filter_parameter_logging :password, :password_confirmation
    
  before_filter :check_user
  
  def self.active_scaffold_controller_for(klass)
    
    # if a model class doesn't have a module then it is part of the containing
    # app and we assume it has a module of Admin
    if not /::/ === klass.to_s()
       return internal_active_scaffold_controller_for(klass, klass.to_s(), "Admin::")
    end

    super  
  end
  
  private

  def check_user
    if logged_in?
      self.current_user = current_user
    else
      self.current_user = User.anonymous 
    end
  end


  def redirect_back_or(path)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to path
  end
  
end