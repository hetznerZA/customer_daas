module CustomerDaas
  module Test
    class StubCustomerDaasOrchestrationProvider < BaseCustomerDaasOrchestrationProvider
    end
  end
end

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("stub", "Create Customer Profile", CustomerDaas::Test::StubCustomerDaasOrchestrationProvider)
