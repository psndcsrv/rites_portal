class RitesPortal::ApplicationController < ActionController::Base
  layout 'rites_portal_standard'
  
  def self.active_scaffold_controller_for(klass)
    controller =  "#{klass.to_s().sub('::','::Scaffold::').pluralize()}Controller".constantize rescue controller = super
    
    raise ActiveScaffold::ControllerNotFound, "#{controller} missing ActiveScaffold based on model: #{klass}", caller unless controller.uses_active_scaffold?
    raise ActiveScaffold::ControllerNotFound, "ActiveScaffold on #{controller} is not for #{klass} model.", caller unless controller.active_scaffold_config.model == klass

    return controller
  end
end