# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsuit/version'

Gem::Specification.new do |spec|
  spec.name          = "rsuit"
  spec.version       = Rsuit::VERSION
  spec.authors       = ["littleyang"]
  spec.email         = ["littleyangqh@gmail.com"]
  spec.description   = %q{rails test framework rspec tool suit}
  spec.summary       = %q{this is a rails test frame work,rspec tool suit. which contain rspec,guard,sprok and easy to install ,init}
  spec.homepage      = "https://github.com/littleyang/rsuit.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails","~> 4.0.3"
end
