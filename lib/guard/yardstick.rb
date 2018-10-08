# frozen_string_literal: true

require 'guard/compat/plugin'
require 'yardstick'
require 'yaml'

module Guard
  # A guard plugin to run yardstick on every save
  class Yardstick < Plugin
    # A hash of options for configuring the plugin
    #
    # @api private
    # @return [Hash]
    attr_reader :options

    # Initializes guard-yardstick
    #
    # @api private
    # @return [Guard::Yardstick]
    def initialize(args = {})
      super

      @options = {
        all_on_start: true,
        config: nil
      }.merge(args)
    end

    # When guard starts will run all files if :all_on_start is set
    #
    # @api private
    # @return [Void]
    def start
      run_all if options[:all_on_start]
    end

    # Will run all files through yardstick
    #
    # @api private
    # @return [Void]
    def run_all
      UI.info 'Inspecting Yarddoc in all files'
      inspect_with_yardstick
    end

    # Will run when files are added
    #
    # @api private
    # @return [Void]
    def run_on_additions(paths)
      run_partially(paths)
    end

    # Will run when files are changed
    #
    # @api private
    # @return [Void]
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

      inspect_with_yardstick(path: paths)
    end

    # Runs yardstick and outputs results to STDOUT
    #
    # @api private
    # @return [Void]
    def inspect_with_yardstick(yardstick_options = {})
      config = ::Yardstick::Config.coerce(yardstick_config(yardstick_options))
      measurements = ::Yardstick.measure(config)
      measurements.puts
    rescue StandardError => error
      UI.error 'The following exception occurred while running ' \
               "guard-yardstick: #{error.backtrace.first} " \
               "#{error.message} (#{error.class.name})"
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

    # Merge further options with yardstick config file.
    #
    # @api private
    # @return [Hash] Hash of options for yardstick measurement
    def yardstick_config(extra_options = {})
      return options unless options[:config]

      yardstick_options = YAML.load_file(options[:config])
      yardstick_options.merge(extra_options)
    end
  end
end
