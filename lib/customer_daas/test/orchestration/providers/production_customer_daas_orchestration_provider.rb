module CustomerDaas
  module Test
    class ProductionCustomerDaasOrchestrationProvider < BaseCustomerDaasOrchestrationProvider
    end
  end
end

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("production", "Customer Profile Creation", CustomerDaas::Test::ProductionCustomerDaasOrchestrationProvider)

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("tfa", "Customer Profile Creation", CustomerDaas::Test::ProductionCustomerDaasOrchestrationProvider)
