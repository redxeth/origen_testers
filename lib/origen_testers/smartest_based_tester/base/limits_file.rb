require 'pathname'
module OrigenTesters
  module SmartestBasedTester
    class Base
      class LimitsFile
        include OrigenTesters::Generator

        attr_accessor :test_limits
        attr_accessor :filename, :id

        def initialize(options = {})
          @test_limits = []
        end

        def subdirectory
          'testtable/limits'
        end

      end
    end
  end
end
