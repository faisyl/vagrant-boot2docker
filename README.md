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
	config.vm.network "public_network"
...
end
```

With the default tinycore implementation, this would break since it didn't handle dhcp correctly. For boot2docker, if there's no valid IP defined, it's simply ignored.

