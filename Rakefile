# frozen_string_literal: true

require 'yaml'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

require 'yardstick/rake/measurement'
yardstick_options = YAML.load_file('.yardstick.yml')

Yardstick::Rake::Measurement.new(:yardstick_measure, yardstick_options)

require 'yardstick/rake/verify'

Yardstick::Rake::Verify.new(:yardstick, yardstick_options)

task default: %i[spec rubocop yardstick]
