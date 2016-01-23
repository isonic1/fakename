# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fakename/version'

Gem::Specification.new do |spec|
  spec.name          = "fakename"
  spec.version       = Fakename::VERSION
  spec.authors       = ["Justin Ison"]
  spec.email         = ["justin.ison@gmail.com"]

  spec.summary       = %q{Test Data Generator}
  spec.description   = %q{This gem scrapes the https://fakena.me/ site.}
  spec.homepage      = "https://github.com/isonic1/fakename"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "mechanize", "~> 2.7"
  
  spec.post_install_message = "**** Please read legal terms at -> https://fakena.me/legal/ <- before using ****\n"
end
