require 'guard'
require 'guard/plugin'
require 'yardstick'

module Guard
  class Yardstick < Plugin

    def initialize(options = {})
      super

      @options = {
        all_on_start: true
      }.merge(options)
    end

    def start
      run_all if @options[:all_on_start]
    end

    def run_all
      UI.info 'Inspecting Yarddoc in all files'

      inspect_with_yardstick
    end

    def run_on_additions(paths)
      run_partially(paths)
    end

    def run_on_modifications(paths)
      run_partially(paths)
    end

    private

    def run_partially(paths)
      return if paths.empty?

      displayed_paths = paths.map { |path| smart_path(path) }
      UI.info "Inspecting Yarddocs: #{displayed_paths.join(' ')}"

      inspect_with_yardstick(paths)
    end

    def inspect_with_yardstick(paths = [])
      measurements = ::Yardstick.measure
      measurements.puts
    rescue => error
      UI.error 'The following exception occurred while running guard-yardstick: ' \
               "#{error.backtrace.first} #{error.message} (#{error.class.name})"
    end

    def smart_path(path)
      if path.start_with?(Dir.pwd)
        Pathname.new(path).relative_path_from(Pathname.getwd).to_s
      else
        path
      end
    end

   end

end
