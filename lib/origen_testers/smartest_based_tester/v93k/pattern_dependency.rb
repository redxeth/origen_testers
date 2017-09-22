module OrigenTesters
  module SmartestBasedTester
    class V93K
      require 'origen_testers/smartest_based_tester/base/pattern_dependency'
      class PatternDependency < Base::PatternDependency
        TEMPLATE = "#{Origen.root!}/lib/origen_testers/smartest_based_tester/v93k/templates/pattdep.json.erb"
      end
    end
  end
end
