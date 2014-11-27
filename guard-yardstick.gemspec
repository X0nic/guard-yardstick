# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/yardstick/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-yardstick'
  spec.version       = Guard::YardstickVersion
  spec.authors       = ['Nathan Lee']
  spec.email         = ['nathan@globalphobia.com']
  spec.description   = 'Guard::Yardstick automatically checks your code for missing yardocs ' \
                       'when files are modified.'
  spec.summary       = 'Guard plugin for Yardstick'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'guard',     '>= 2.0'
  spec.add_runtime_dependency 'yardstick', '>= 0.9'

  # spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
