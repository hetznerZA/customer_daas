require 'soar_customer'
require_relative 'model_factory'

module SoarSc
  module Web
    module Models
      class Customer
        attr_reader :configuration
        attr_accessor :data_provider

        class SoarCustomerDaasError < StandardError; end

        def initialize(configuration)
          @configuration = configuration
          validate_configuration
          factory = SoarSc::Web::Models::ModelFactory.new(@configuration)
          @data_provider = factory.create
          authenticate
        end

        protected
        def authenticate
          credential = {
            'username' => configuration['username'],
            'password' => configuration['password']
          }
          @data_provider.authenticate(credential)
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
