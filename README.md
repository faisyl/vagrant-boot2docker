# Boot2docker plugin

This plugin makes working with boot2docker guests in [Vagrant](http://www.vagrantup.com) a bit nicer:

* Allow network configuration to use dhcp

## Install:

```bash
$ vagrant plugin install vagrant-boot2docker
```

## Example Vagrantfile

```ruby
Vagrant.configure("2") do |config|
...
  	# Setup networking
	config.vm.network "public_network", ip: "0.0.0.0"
...
end
```

In the above `Vagrantfile` example, setting the ip to `0.0.0.0` effectively switches off the forced ip configuration that the current tinycore implementaton does (which fails without a valid IP address).

## Issues

This should ideally just work without a valid IP (or invalid IP in our case). That's an exercise for v 0.0.2 :)
