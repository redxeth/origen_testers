module OrigenTesters
  module SmartestBasedTester
    class Base
      class TestMethods
        class Limits
          attr_reader :test_method
          attr_accessor :lo_limit, :hi_limit
          attr_accessor :unit
          alias_method :units, :unit
          attr_accessor :tnum
          alias_method :lo, :lo_limit
          alias_method :lo=, :lo_limit=
          alias_method :hi, :hi_limit
          alias_method :hi=, :hi_limit=
          attr_accessor :lo_type, :hi_type
          alias_method :lsl_type, :lo_type
          alias_method :lsl_typ, :lo_type
          alias_method :hsl_type, :hi_type
          alias_method :hsl_typ, :hi_type

          def initialize(test_method)
            @test_method = test_method
            @tnum = ''
            @lo_type = 'GE'
            @hi_type = 'LE'
          end

          def lo_type=(val)
            case val.to_s.downcase
            when 'ge'
              @lo_type = 'GE'
            when 'gt'
              @lo_type = 'GT'
            when 'na'
              @lo_type = 'NA'
            else
              fail "Lo limit type of #{val} not understood!"
            end
          end
          alias_method :lsl_type=, :lo_type=
          alias_method :lsl_typ=, :lo_type=

          def hi_type=(val)
            case val.to_s.downcase
            when 'le'
              @hi_type = 'LE'
            when 'lt'
              @hi_type = 'LT'
            when 'na'
              @hi_type = 'NA'
            else
              fail "Hi limit type of #{val} not understood!"
            end
          end
          alias_method :hsl_type=, :hi_type=
          alias_method :hsl_typ=, :hi_type=

          def unit=(val)
            case val.to_s.downcase
            when 'v', 'volts'
              @unit = 'V'
            when 'a', 'amps'
              @unit = 'A'
            else
              fail "Limit unit of #{val} not implemented yet!"
            end
          end
          alias_method :units=, :unit=

          def to_s
            if !lo_limit && !hi_limit
              if tnum == ''
                "\"#{test_name}\"" + ' = "":"NA":"":"NA":"":"":""'
              else
                "\"#{test_name}\"" + " = \"\":\"NA\":\"\":\"NA\":\"\":\"#{tnum}\":\"0\""
              end
            elsif !lo_limit
              "\"#{test_name}\"" + " = \"\":\"NA\":\"#{hi_limit}\":\"LE\":\"#{unit}\":\"#{tnum}\":\"0\""
            elsif !hi_limit
              "\"#{test_name}\"" + " = \"#{lo_limit}\":\"GE\":\"\":\"NA\":\"#{unit}\":\"#{tnum}\":\"0\""
            else
              "\"#{test_name}\"" + " = \"#{lo_limit}\":\"GE\":\"#{hi_limit}\":\"LE\":\"#{unit}\":\"#{tnum}\":\"0\""
            end
          end

          def set_lo_limit(val)
            self.lo_limit = val
          end

          def set_hi_limit(val)
            self.hi_limit = val
          end

          private

          def test_name
            name = test_method.test_name if test_method.respond_to?(:test_name)
            name || 'Functional'
          end
        end
      end
    end
  end
end
