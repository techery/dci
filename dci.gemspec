# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dci/version'

Gem::Specification.new do |spec|
  spec.name          = 'dci'
  spec.version       = DCI::VERSION
  spec.authors       = ['Michael Kurtikov']
  spec.email         = 'hello@techery.io'
  spec.summary       = 'Simple DCI implementation for Rails.'
  spec.description   = <<-description
    Simple DCI implementation for Rails.
    Extracted from Victor's Savkin DCI-Sample (https://github.com/vsavkin/DCI-Sample)
  description

  spec.homepage      = 'http://techery.io'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
