module CustomerDaas
  module Test
    class ProductionBootstrapOrchestrationProvider < BaseBootstrapOrchestrationProvider
    end
  end
end

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("production", "Bootstrap with configuration service", CustomerDaas::Test::ProductionBootstrapOrchestrationProvider)
CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("production", "Bootstrap with identifier", CustomerDaas::Test::ProductionBootstrapOrchestrationProvider)

CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("tfa", "Bootstrap with configuration service", CustomerDaas::Test::ProductionBootstrapOrchestrationProvider)
CustomerDaas::Test::OrchestrationProviderRegistry.instance.register("tfa", "Bootstrap with identifier", CustomerDaas::Test::ProductionBootstrapOrchestrationProvider)
