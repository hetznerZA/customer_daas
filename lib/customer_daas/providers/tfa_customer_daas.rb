require 'customer_daas'
require 'jsender'

module CustomerDaas
  module Test
    class TfaCustomerDaas < CustomerDaas::Providers::CustomerDaasProvider
      include Jsender
            
      def initialize
      end
    end
  end
end
