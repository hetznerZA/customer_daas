require 'web/controllers/configured_controller'

module SoarSc
  module Web
    module Controllers
      class CreateProfile < ConfiguredController
        def serve(request)
          customer = SoarSc::Web::Models::Customer.new(@configuration['providers']['datastore'])
          params = request.body.read.to_s
          result = customer.create_profile(params)
          [200, result]
        end
      end
    end
  end
end