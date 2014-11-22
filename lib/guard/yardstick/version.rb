module Guard
  # A workaround for declaring `class Yardstick`
  # before `class Yardstick < Guard` in yardstick.rb
  module YardstickVersion
    # http://semver.org/
    MAJOR = 0
    MINOR = 0
    PATCH = 1

    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
