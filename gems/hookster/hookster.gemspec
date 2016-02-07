# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'hookster'
  spec.version       = '0.0.1'
  spec.authors       = ['Chris Raethke']
  spec.email         = ['chris@codesoda.com']
  spec.summary       = 'Provides a base layer for configuring hooks and calling external web services to notify of events in a parent application'
  spec.homepage      = 'https://github.com/codesoda'
  spec.license       = 'MIT'

  spec.files         = Dir.glob("{lib,spec}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 4.1'

  spec.add_development_dependency 'bundler', '~> 1.5'
end
