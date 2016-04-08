# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "customer_daas/version"

Gem::Specification.new do |spec|
  spec.name          = "customer_daas"
  spec.version       = CustomerDaas::VERSION
  spec.authors       = ["Dane-Garrin Balia"]
  spec.email         = ["dane.balia@hetzner.co.za"]

  spec.summary       = %q{Customer data service as a bridge to business services}
  spec.description   = %q{Customer data service as a bridge to business services}
  spec.homepage      = "https://github.com/hetznerZA/customer_daas"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "rspec-expectations", "~> 3.3"
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'byebug'
  spec.add_dependency 'jsender', "~>0.1.5"
  spec.add_dependency 'soar_customer', "~> 0.1"
end
