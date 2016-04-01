module CustomerDaas
  module Test
    class StubBootstrapOrchestrationProvider < BaseBootstrapOrchestrationProvider
    end
  end
end

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("stub", "Bootstrap with configuration service", CustomerDaas::Test::StubBootstrapOrchestrationProvider)
CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("stub", "Bootstrap with identifier", CustomerDaas::Test::StubBootstrapOrchestrationProvider)
