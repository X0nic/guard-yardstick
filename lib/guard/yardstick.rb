require 'guard'
require 'guard/plugin'
require 'yardstick'

module Guard
  class Yardstick < Plugin

    # Initializes guard-yardstick
    #
    # @api public
    # @return [Guard::Yardstick]
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

    # Runs yardstick on a partial set of paths passed in by guard
    #
    # @api private
    # @return [Void]
    def run_partially(paths)
      return if paths.empty?

      displayed_paths = paths.map { |path| smart_path(path) }
      UI.info "Inspecting Yarddocs: #{displayed_paths.join(' ')}"

      inspect_with_yardstick(paths)
    end

    # Runs yardstick and outputs results to STDOUT
    #
    # @api private
    # @return [Void]
    def inspect_with_yardstick(paths = [])
      measurements = ::Yardstick.measure
      measurements.puts
    rescue => error
      UI.error 'The following exception occurred while running guard-yardstick: ' \
               "#{error.backtrace.first} #{error.message} (#{error.class.name})"
    end

    # Returns a path with pwd removed if needed
    #
    # @api private
    # @return [String]
    def smart_path(path)
      if path.start_with?(Dir.pwd)
        Pathname.new(path).relative_path_from(Pathname.getwd).to_s
      else
        path
      end
    end

   end

end
