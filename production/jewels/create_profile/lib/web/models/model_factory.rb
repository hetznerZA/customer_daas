require 'soar_customer'

module SoarSc
  module Web
    module Models
      class ModelFactory
        attr_accessor :configuration

        def initialize(configuration)
          @configuration = configuration
        end

        def create
          eval(@configuration['adaptor']).new(@configuration)
        end
      end
    end
  end
end
