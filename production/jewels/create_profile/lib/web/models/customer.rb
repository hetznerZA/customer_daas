require 'soar_customer'

module SoarSc
  module Web
    module Models
      class Customer 
        attr_reader :configuration

        class SoarCustomerDaasError < StandardError; end

        def initialize(configuration)
          @configuration = configuration
          validate_configuration
        end

        private 
        def validate_configuration
          raise SoarCustomerDaasError.new('No configuration') if @configuration.nil? || @configuration.empty?
          raise SoarCustomerDaasError.new('Missing username') if @configuration['username'].nil? || @configuration['username'].empty?
          raise SoarCustomerDaasError.new('Missing password') if @configuration['password'].nil? || @configuration['password'].empty?
          raise SoarCustomerDaasError.new('Missing server url') if @configuration['server_url'].nil? || @configuration['server_url'].empty?
          raise SoarCustomerDaasError.new('Missing adaptor') if @configuration['adaptor'].nil? || @configuration['adaptor'].empty?
        end
      end
    end
  end
end
