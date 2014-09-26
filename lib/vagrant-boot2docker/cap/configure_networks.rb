require "ipaddr"

module VagrantPlugins
  module Boot2docker
    module Cap
      class ConfigureNetworks
        def self.configure_networks(machine, networks)
          machine.communicate.tap do |comm|
            networks.each do |n|
              if n.key?("ip")
	              ifc = "/sbin/ifconfig eth#{n[:interface]}"
                iface = "eth#{n[:interface]}"
	              broadcast = (IPAddr.new(n[:ip]) | (~ IPAddr.new(n[:netmask]))).to_s
                # First kill the udhcp client for this interface
                comm.sudo("ps -ef |grep dhcp | grep #{iface} | grep -v grep | tr -s ' ' | cut -d' ' -f2| xargs kill")
	              comm.sudo("#{ifc} down")
	              comm.sudo("#{ifc} #{n[:ip]} netmask #{n[:netmask]} broadcast #{broadcast}")
	              comm.sudo("#{ifc} up")
              end
            end
          end
        end
      end
    end
  end
end
