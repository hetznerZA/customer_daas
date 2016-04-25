module CustomerDaas
  module Test
    class StubCustomerDaasOrchestrationProvider < BaseCustomerDaasOrchestrationProvider
    end
  end
end

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register(
  "stub", 
  "Create Customer Profile", 
  CustomerDaas::Test::StubCustomerDaasOrchestrationProvider
  )
CustomerDaas::Test::OrchestrationProviderRegistry.instance.register(
  "stub", 
  "Bootstrap with an injected configuration", 
  CustomerDaas::Test::StubCustomerDaasOrchestrationProvider
  )
