module OrigenTesters
  module SmartestBasedTester
    class V93K
      require 'origen_testers/smartest_based_tester/base/pattern_definition'
      class PatternDefinition < Base::PatternDefinition
        TEMPLATE = "#{Origen.root!}/lib/origen_testers/smartest_based_tester/v93k/templates/pattdef.csv.erb"
      end
    end
  end
end
