# frozen_string_literal: true

module Guard
  # A workaround for declaring `class Yardstick`
  # before `class Yardstick < Guard` in yardstick.rb
  module YardstickVersion
    # http://semver.org/
    MAJOR = 1
    MINOR = 0
    PATCH = 0

    # Returns a formatted version string
    #
    # @example
    #   Guard::YardstickVersion.to_s # => '0.0.0.2'
    #
    # @return [String]
    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
