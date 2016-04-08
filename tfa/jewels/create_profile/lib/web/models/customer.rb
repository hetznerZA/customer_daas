require 'soar_customer'

module SoarSc
  module Web
    module Models
      class Customer
        attr_accessor :configuration
        attr_accessor :data_provider

        def initialize(configuration)
          provider_config = configuration['providers']['datastore']
          factory = SoarSc::Web::Models::ModelFactory.new(configuration)
          @data_provider = factory.create('datastore')
          @data_provider.bootstrap(provider_config)
          authenticate(provider_config)
        end

        def create_profile(customer_info)
          response = @data_provider.create_profile(customer_info)
        end

        private

        def authenticate(configuration)
          credential = { 
            'username' => configuration['username'],
            'password' => configuration['password']
          }
          @data_provider.authenticate(credential)
        end
      end
    end
  end
end