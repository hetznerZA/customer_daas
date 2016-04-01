$LOAD_PATH.unshift File.expand_path("../../../lib/customer_daas", __FILE__)

class Requires
  def self.require_files
    require "customer_daas"
    require 'providers/bootstrapped_provider'
    require 'test/orchestration/providers/base_classes/base_orchestration_provider'
    require 'test/orchestration/providers/base_classes/base_bootstrap_orchestration_provider'
    require 'test/orchestration/orchestration_provider_registry'
    require 'test/orchestration/orchestration_environment_factory'
    Dir.glob(File.expand_path('../../../lib/customer_daas/providers/*.rb',__FILE__), &method(:require))
    Dir.glob(File.expand_path('../../../lib/customer_daas/providers/mocks/*.rb',__FILE__), &method(:require))
    Dir.glob(File.expand_path('../../../lib/customer_daas/test/orchestration/providers/*.rb',__FILE__), &method(:require))
  end
end
