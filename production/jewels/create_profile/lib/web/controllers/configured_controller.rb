require 'net/http'
require 'uri'

module SoarSc
  module Web
    module Controllers
      class ConfiguredController
        attr_accessor :configuration

        def initialize(configuration)
          @configuration = configuration
        end

        def body(request)
          return request.body.gets if request.body.is_a? Rack::Lint::InputWrapper
          request.body
        end

        def serve(request)
          [ 501, "Not implemented" ]
        end
      end
    end
  end
end

