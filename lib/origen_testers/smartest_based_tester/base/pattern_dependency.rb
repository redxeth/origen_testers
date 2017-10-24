require 'pathname'
module OrigenTesters
  module SmartestBasedTester
    class Base
      class PatternDependency
        include OrigenTesters::Generator

        attr_accessor :filename, :part_patterns, :id, :subdir

        def initialize(flow = nil)
          @part_patterns = []
        end

        def subdirectory
          if $tester.smartbuild_capable
            # Mod to make separate output dir per flow file
            "#{@subdir}"
          end
        end

        def subroutines
          (references[:subroutine][:all] + references[:subroutine][:ate]).map do |p|
            p.strip.sub(/\..*/, '')
          end.uniq.sort
        end

        def patterns
          (references[:main][:all] + references[:main][:ate]).map do |p|
            p.strip.sub(/\..*/, '')
          end.uniq.sort
        end

        def references
          # need to update to say you want all unique_pattern_references, if any
          Origen.interface.all_pattern_references[id]
        end
      end
    end
  end
end
