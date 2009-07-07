require 'uri'
require 'net/http'

module RitesPortal::SdsConnect
  
  class Connect
    # Everything is now a class method effectively turning
    # this back into a singleton.
    # The path to the sds configuration file to use. (Defaults to
    # <tt>config/sds.yml</tt>.)
    cattr_accessor :config
    cattr_reader :sail_user_path, :sail_user_resource

    # This setup normally only needs to be run once.
    # It initializes some class variables with the default config values
    # or the config values can be passed in as a hash:
    #   {"host"=>"http://saildataservice.concord.org", 
    #    "curnit_id"=>63, "jnlp_id"=>19, 
    #    "username"=>"user", "password"=>"password"}
    # If you change these values after they have been set
    # you will probably invalidate any local copies of sds recource ids.
    def self.setup(config = nil)
      return @@config if @@config && @@config['version']
      config = YAML::load(ERB.new(IO.read("#{RAILS_ROOT}/config/sds.yml")).result)[RAILS_ENV] unless config
      @@config = config
      @@config = @@config.merge({"name"=>"Sail Data Service", "version"=>"1.1"})
      if @@config['version'].to_f >= 1.1
        @@sail_user_path = '/sail_user' 
        @@sail_user_resource = 'sail-user'
      else
        @@sail_user_path = '/user' 
        @@sail_user_resource = 'user'
      end
      @@config
    end
    
    # Note: strange bug that should be tracked down!
    #
    # For some reason this method:
    #
    #   SdsConnect::Connect.properties
    #
    # doesn't work when both the DIY and the SDS are run 
    # from Phusion Passenger. Line 26 above should have looked like this:
    #
    #   @@config = @@config.merge(properties)
    #
    # but that causes a hang on first page load.
    #
    # If the statement SdsConnect::Connect.properties is placed in 
    # config/initializers/diy.rb or app/controllers/application.rb
    # the startup process will hang.
    #
    # However if it is placed in app/controlelrs/home_controller.rb
    # the startup process works normally.
    #
    # So for now since all the SDSs we work with are version 1.1
    # these properties are hard-coded.
    def self.properties
      get_resource('/')['sds']
    end

    def self.host_url
      @@config['host']
    end

    def self.jnlp_id
      @@config['jnlp_id']
    end
    
    def self.jnlp_url
      "#{@@config['host']}/jnlp/#{@@config['jnlp_id']}"
    end

    def self.curnit_id
      @@config['curnit_id']
    end
    
    def self.curnit_url
      "#{@@config['host']}/curnit/#{@@config['curnit_id']}"
    end

    def self.offering_url(offering_id)
      "#{@@config['host']}/offering/#{offering_id}"
    end

    def self.workgroup_url(workgroup_id)
      "#{@@config['host']}/workgroup/#{workgroup_id}"
    end
    
    # --- SailUser
    # pass: first_name, last_name
    # returns sail_user_id
    def self.create_sail_user(first_name, last_name)
        post_resource(@@sail_user_path, "<#{@@sail_user_resource}><first-name>#{first_name}</first-name><last-name>#{last_name}</last-name></#{@@sail_user_resource}>")
    end

    # pass: sail_user_id, first_name, last_name
    # returns sail_user_id
    def self.update_sail_user(sail_user_id, first_name, last_name) 
      put_resource("#{@@sail_user_path}/#{sail_user_id}", "<#{@@sail_user_resource}><first-name>#{first_name}</first-name><last-name>#{last_name}</last-name></#{@@sail_user_resource}>")
    end

    # pass: sail_user_id
    # returns: http return code
    def self.delete_sail_user(sail_user_id) 
      delete_resource("#{@@sail_user_path}/#{sail_user_id}")
    end

    # pass: sail_user_id
    # returns hash: sail_user
    def self.sail_user(sail_user_id) 
      get_resource("#{@@sail_user_path}/#{sail_user_id}")
    end
    
    # --- Offering ---
    # pass: name, jnlp_id, curnit_id
    # returns offering_id
    def self.create_offering(name, jnlp_id, curnit_id)
      name.gsub!("&", "&amp;")
      name.gsub!("<", "&lt;")
      name.gsub!(">", "&gt;")
      post_resource("/offering", "<offering><name>#{name}</name><curnit-id>#{curnit_id}</curnit-id><jnlp-id>#{jnlp_id}</jnlp-id></offering>")
    end
    
    # pass: offering_id, jnlp_id, curnit_id, name
    # returns offering_id
    def self.update_offering(offering_id, jnlp_id, curnit_id, name) 
      name.gsub!("&", "&amp;")
      name.gsub!("<", "&lt;")
      name.gsub!(">", "&gt;")
      put_resource("/offering/#{offering_id}", "<offering><name>#{name}</name><curnit-id>#{curnit_id}</curnit-id><jnlp-id>#{jnlp_id}</jnlp-id></offering>")
    end

    # pass: offering_id
    # returns: http return code
    def self.delete_offering(offering_id) 
      delete_resource("/offering/#{offering_id}")
    end

    # pass: offering_id
    # returns hash: offering
    def self.offering(offering_id) 
      get_resource("/offering/#{offering_id}")
    end
    
    # --- Jnlp ---
    # pass: path, name
    # returns jnlp_id
    def self.create_jnlp(url, name)
      post_resource("/jnlp", "<jnlp><name>#{name}</name><url>#{url}</url></jnlp>")
    end
    
    # pass: jnlp_id, url, name
    # returns jnlp_id
    def self.update_jnlp(jnlp_id, url, name) 
      put_resource("/jnlp/#{jnlp_id}", "<jnlp><name>#{name}</name><url>#{url}</url></jnlp>")
    end

    # pass: jnlp_id
    # returns: http return code
    def self.delete_jnlp(jnlp_id) 
      delete_resource("/jnlp/#{jnlp_id}")
    end

    # pass: jnlp_id
    # returns hash: jnlp
    def self.jnlp(jnlp_id) 
      get_resource("/jnlp/#{jnlp_id}")
    end
        
    # --- Curnit ---
    # pass: path, name
    # returns curnit_id
    def self.create_curnit(url, name)
      post_resource("/curnit", "<curnit><name>#{name}</name><url>#{url}</url></curnit>")
    end
    
    # pass: curnit_id, url, name
    # returns scurnit_id
    def self.update_curnit(curnit_id, url, name) 
      put_resource("/curnit/#{curnit_id}", "<curnit><name>#{name}</name><url>#{url}</url></curnit>")
    end

    # pass: curnit_id
    # returns: http return code
    def self.delete_curnit(curnit_id) 
      delete_resource("/curnit/#{curnit_id}")
    end

    # pass: curnit_id
    # returns hash: curnit
    def self.curnit(curnit_id) 
      get_resource("/curnit/#{curnit_id}")
    end
    
    # bundle_content_ot_learner_data
    def self.bundle_content_ot_learner_data(bundle_content_id)
      get_resource("/bundle_contents/#{bundle_content_id}/ot_learner_data", false)
    end
    
    # --- Workgroup ---
    # pass: name, offering_id
    # returns workgroup_id
    def self.create_workgroup (name, offering_id)
      post_resource("/workgroup", "<workgroup><name>#{name}</name><offering-id>#{offering_id}</offering-id></workgroup>")
    end

    # pass: workgroup_id, name, offering_id
    # returns: workgroup_id
    def self.update_workgroup(workgroup_id, name, offering_id) 
      put_resource("/workgroup/#{workgroup_id}", "<workgroup><name>#{name}</name><offering-id>#{offering_id}</offering-id></workgroup>")
    end

    # pass: workgroup_id
    # returns: http return code
    def self.delete_workgroup(workgroup_id) 
      delete_resource("/workgroup/#{workgroup_id}")
    end

    # pass: offering_id
    # returns hash: offering
    def self.workgroup(workgroup_id) 
      get_resource("/workgroup/#{workgroup_id}")
    end

    # pass: offering_id
    # returns xml otml user data
    def self.workgroup_ot_learner_data(workgroup_id) 
      get_resource("/workgroups/#{workgroup_id}/ot_learner_data", false)
    end
    
    # --- WorkgroupMembership
    # pass: workgroup_id, sail_users[]
    # returns nil
    def self.create_workgroup_membership(workgroup_id, sail_users)
      sail_users = [sail_users].flatten # convert a single numberic value into an array
      members = sail_users.collect {|i| "<workgroup-membership><#{@@sail_user_resource}-id>#{i}</#{@@sail_user_resource}-id></workgroup-membership>" }.join 
      post_resource("/workgroup/#{workgroup_id}/membership", "<workgroup-memberships>#{members}</workgroup-memberships>")
    end

#    # pass: workgroup_id, sail_users[]
#    # returns: workgroup_id
#    alias update_workgroup_membership create_workgroup_membership

    # pass: workgroup_id
    # returns: http return code
    def self.delete_workgroup_membership(workgroup_id) 
      delete_resource("/workgroup/#{workgroup_id}/membership")
    end

    # pass: workgroup_id
    # returns hash: workgroup_membership
    def self.workgroup_membership(workgroup_id, version=nil)
      v = version ? "/#{version.to_s}" : '' 
      get_resource("/workgroup/#{workgroup_id}/membership#{v}")
    end

#    private

    def self.post_resource(path, resource)
      uri = URI.parse("#{@@config['host']}#{path}")
      # puts uri.to_s
      # puts resource
      # puts
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.post(uri.path, resource, 'Content-Type' => 'application/xml')
        unless response.class == Net::HTTPCreated
          ActionController::Base.logger.warn("\n\npost_resource:\n  path: #{path}, uri: #{uri.to_s}\n  resource: #{resource}")
          ActionController::Base.logger.warn("  response: #{response.code}: #{response.message}\n  body: \n#{response.body}\n\n")
        end
        begin
          response['Location'][/\d+$/].to_i
        rescue
          ActionController::Base.logger.warn("SdsConnect: post_resource: #{uri}")
          nil
        end
      end
    end
    
    def self.put_resource(path, resource) 
      uri = URI.parse("#{@@config['host']}#{path}")
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.put(uri.path, resource, 'Content-Type' => 'application/xml')
        response['Location'][/\d+$/].to_i
      end
    end
    
    def self.get_resource(path, return_hash=true) 
      uri = URI.parse("#{@@config['host']}#{path}")
      Net::HTTP.start(uri.host, uri.port) do |http|
        res = http.get(uri.path, 'Accept' => 'application/xml').body
        if return_hash
          Hash.from_xml(res)
        else
          res
        end
      end
    end
        
    def self.delete_resource(path) 
      uri = URI.parse("#{@@config['host']}#{path}")
      Net::HTTP.start(uri.host, uri.port) do |http|
        http.delete(uri.path, 'Accept' => 'application/xml').code
      end
    end     
  end
end
