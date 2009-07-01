# Include hook code here
require File.join(File.dirname(__FILE__), '/lib/rites_portal.rb')

# Using a separate DB isn't going to work because of the various join tables we'll have to make to the existing app's db
# begin
#   RitesPortal.configure_connections(:rites_portal)
# rescue Exception
# end

require 'activesupport'

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'clazz', 'clazzes'
end