require 'jsender'

module CustomerDaas
  module Test
    class StubCustomerDaas < CustomerDaas::Providers::CustomerDaasProvider
      include Jsender

      attr_reader :customer, :profile_creation_result
      
      def initialize(data_source)
        @data_source = data_source
        @profile_creation_result = {}
        @customer = {}
      end

      def build_customer(request_params)
        @customer = JSON.parse(request_params)
      end

      def submit_to_data_source
        @profile_creation_result = @data_source.create_profile(@customer)
      rescue Exception => e
        fail 'Failed to create profile'
      end

      def break_response
        @data_source.break_response
      end
    end
  end
end
