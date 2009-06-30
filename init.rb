# Include hook code here
require File.join(File.dirname(__FILE__), '/lib/rites_portal.rb')

begin
  RitesPortal.configure_connections(:rites_portal)
rescue Exception
end