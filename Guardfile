# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :yardstick do
  watch(/.+\.rb$/)
end

guard :rubocop, all_on_start: true, cli: ['--display-cop-name']do
  watch('guard-yardstick.gemspec')
  watch(/^(|Rakefile|Guardfile)/)
  watch(/.+\.rb$/)
end
