require 'guard'
require 'guard/plugin'

module Guard
  class Yardstick < Plugin

    def initialize(options = {})
      super

      @options = {
        all_on_start: true,
        cli: ['./**/*.rb']
      }.merge(options)
    end

    def start
      run_all if @options[:all_on_start]
    end

    def run_all
      UI.info 'Inspecting Yarddoc in all files'
      system(build_command)
    end

    private

    def build_command
      cli = options[:cli].join(' ')

      "bundle exec yardstick #{cli}"
    end

   end

end
