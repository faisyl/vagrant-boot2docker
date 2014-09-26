begin
	require "vagrant"
rescue LoadError
	raise "The boot2docker plugin must be run within Vagrant."
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
	raise "The Boot2docker plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
	module Boot2docker
		class Plugin < Vagrant.plugin("2")
			name "boot2docker"
			description <<-DESC
			This plugin installs boot2docker guest capabilities.
			DESC

			guest("boot2docker", "tinycore") do
				require_relative "guest"
				Guest
			end

			guest_capability("boot2docker", "configure_networks") do
				require_relative "cap/configure_networks"
				Cap::ConfigureNetworks
			end

		end

	end
end
