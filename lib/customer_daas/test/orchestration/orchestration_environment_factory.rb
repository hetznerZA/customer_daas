module CustomerDaas

  module Test

    module OrchestratorEnvironmentFactory
      class MissingEnvironmentVariable < StandardError; end
      class TestOrchestrationProviderNotSupported < StandardError; end

      def self.build(feature)
        identifier = ENV["TEST_ORCHESTRATION_PROVIDER"] or raise MissingEnvironmentVariable.new("missing environment variable: TEST_ORCHESTRATION_PROVIDER")
        registry = CustomerDaas::Test::OrchestrationProviderRegistry.instance
        provider = registry.lookup(identifier, feature) 
        p = provider.new
        p.inject_iut(CustomerDaas::Test::OrchestratorEnvironmentFactory::build_iut)
        p.setup
        p
      end

      def self.build_iut
        return CustomerDaas::Test::StubCustomerDaas.new if ENV["TEST_ORCHESTRATION_PROVIDER"] == "stub"
        return CustomerDaas::Test::TfaCustomerDaas.new if ENV["TEST_ORCHESTRATION_PROVIDER"] == "tfa"
        return CustomerDaas::Test::SoarAmImplementation.new if ENV["TEST_ORCHESTRATION_PROVIDER"] == "production"
        raise TestOrchestrationProviderNotSupported.new("Could not build iut for #{ENV["TEST_ORCHESTRATION_PROVIDER"]}")
      end
    end

  end

end
