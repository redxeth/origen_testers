module OrigenTesters
  module IGXLBasedTester
    class UltraFLEX
      require 'origen_testers/igxl_based_tester/base/pinmap'
      class Pinmap < Base::Pinmap
        TEMPLATE = "#{Origen.root!}/lib/origen_testers/igxl_based_tester/ultraflex/templates/pinmap.txt.erb"
      end
    end
  end
end
