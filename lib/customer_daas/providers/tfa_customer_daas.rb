require 'customer_daas'
require 'jsender'

module CustomerDaas
  module Test
    class TfaCustomerDaas < CustomerDaas::Providers::BootstrappedProvider
      include Jsender
            
      attr_writer :authorized

      def initialize
        @authorized = true

        # stub out the bootstrapping environment
        @configuration_bootstrap = {'CFGSRV_PROVIDER_ADDRESS' => 'https://127.0.0.1', 'CFGSRV_TOKEN' => 'abcd', 'CFGSRV_IDENTIFIER' => 'identifier' }
        stub = CustomerDaas::Test::StubConfigurationService.new
        stub.configure(@configuration_bootstrap)
        bootstrap(@configuration_bootstrap, stub)
      end
    end
  end
end
