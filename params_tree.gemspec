# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'params_tree/version'

Gem::Specification.new do |spec|
  spec.name          = "params_tree"
  spec.version       = ParamsTree::VERSION
  spec.authors       = ["Vlad Bokov"]
  spec.email         = ["bokov.vlad@gmail.com"]
  spec.cert_chain    = ['certs/razum2um.pem']
  spec.signing_key   = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
  spec.summary       = %q{Cute helper for rabl-filters}
  spec.description   = %q{Turns listed tree to nested hash}
  spec.homepage      = "https://github.com/razum2um/params_tree"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
end
