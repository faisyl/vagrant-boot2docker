# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-boot2docker/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-boot2docker"
  spec.version       = VagrantPlugins::Boot2docker::VERSION
  spec.authors       = ["Faisal P"]
  spec.email         = ["faisal.is@gmail.com"]
  spec.summary       = %q{Guest capabilities for boot2docker}
  spec.description   = %q{Add capabilities and fix dhcp support for boot2docker guests in Vagrant}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
