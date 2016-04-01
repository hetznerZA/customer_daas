require 'jsender'

module CustomerDaas
  module Test
    class StubCustomerDaas < CustomerDaas::Providers::CustomerDaasProvider
      include Jsender
      
      def initialize
      end
    end
  end
end
