class RitesPortal::HomeController < ApplicationController
  
  def readme
    @readme = RitesPortal::ReadMe.new
    render :layout => false
  end
  
end
