require "vagrant-boot2docker/version"
require "vagrant-boot2docker/plugin"

module VagrantPlugins
	module Boot2docker
		lib_path = Pathname.new(File.expand_path("../boot2docker", __FILE__))
		autoload :Action, lib_path.join("action")
		autoload :Errors, lib_path.join("errors")

	    # This returns the path to the source of this plugin.
	    def self.source_root
	    	@source_root ||= Pathname.new(File.expand_path("../../../", __FILE__))
	    end
	end
end
