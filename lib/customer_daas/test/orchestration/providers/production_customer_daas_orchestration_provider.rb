module CustomerDaas
  module Test
    class ProductionCustomerDaasOrchestrationProvider < BaseCustomerDaasOrchestrationProvider
    end
  end
end

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("production", "Create Customer Profile", CustomerDaas::Test::ProductionCustomerDaasOrchestrationProvider)

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("tfa", "Create Customer Profile", CustomerDaas::Test::ProductionCustomerDaasOrchestrationProvider)
