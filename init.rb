# Include hook code here
require File.join(File.dirname(__FILE__), '/lib/portal.rb')
require File.join(File.dirname(__FILE__), '/lib/portal/sds_connect.rb')

# Access this class so that the has_many_polymorphs code will get called and set up the associations in Teacher and Student
# Portal::School

Portal::SdsConnect::Connect.setup

# Using a separate DB isn't going to work because of the various join tables we'll have to make to the existing app's db
# begin
#   Portal.configure_connections(:portal)
# rescue Exception
# end

require 'activesupport'
require 'activerecord'

# setup the plugin so it gets reloaded in development mode
# ActiveSupport::Dependencies.load_once_paths.delete_if {|path| path.match("vendor/plugins/portal")}

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'clazz', 'clazzes'
end

# :user_observer triggers activation emails to be sent when a user registers, and confirmation email to be sent when they activate

ActiveRecord::Base.observers << :user_observer
ActiveRecord::Base.instantiate_observers