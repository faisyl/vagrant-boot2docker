module VagrantPlugins
	module Boot2docker
		class Guest < Vagrant.plugin("2", :guest)
			def detect?(machine)
				machine.communicate.test("test -f /etc/boot2docker")
			end

		end
	end
end