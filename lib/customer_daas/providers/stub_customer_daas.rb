require 'jsender'

module CustomerDaas
  module Test
    class StubCustomerDaas < CustomerDaas::Providers::BootstrappedProvider
      include Jsender
      
      attr_reader :broken
      attr_writer :authorized

      def initialize
        @authorized = true
        @broken = false
      end

      def break
        @broken = true
        success
      end

      def fix
        @broken = false
        success
      end
    end
  end
end
