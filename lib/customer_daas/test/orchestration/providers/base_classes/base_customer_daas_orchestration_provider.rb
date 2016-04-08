module CustomerDaas
  module Test
    class BaseCustomerDaasOrchestrationProvider < BaseOrchestrationProvider
      def initialize
        @request1 = { params: "{\"email_address\":\"dane.balia@hetzner.co.za\",
                     \"password\":\"password123\",\"title\":\"Mr\",
                     \"telephone\":\"0123337777\",\"first_name\":\"Dane\",
                     \"last_name\":\"Balia\",\"street\":\"3 Mooi Man\",
                     \"city\":\"Cape Town\",\"postal_code\":\"7570\",
                     \"country\":\"South Africa\",
                     \"receive_newsletters\":\"true\",
                     \"marketing_referrer\":\"Other\",
                     \"marketing_other\":\"Other\",\"verified\":\"true\",
                     \"id_number\":\"7812161234086\",\"vat_number\":\"\",
                     \"cellphone\":\"0799571010\",\"fax\":\"\",
                     \"company\":\"Hetzner\"}"
                      }
      end

      def given_a_request_for_customer_creation
        @profile_creation_result = {}
        @request_params = @request1[:params]
      end

      def build_a_customer_from_request_params
        @iut.build_customer(@request_params)
      end

      def forward_request_to_relevant_service
        @iut.submit_to_data_source
      end

      def customer_profile_has_been_submitted
        @iut.build_customer(@request_params)
        @profile_creation_result = forward_request_to_relevant_service
      end

      def validate_response_before_returning
        JSON.parse(@profile_creation_result)['profile'].has_key?('client_number')
      end

      def return_success_response
        "{\"status\":\"success\",\"data\":{\"get\":{\"message\":\"Customer Profile Created\",\"client_id\":\"C0345194416\"}}}"
      end

      def return_failed_response
        "{\"status\":\"fail\",\"data\":{\"get\":{\"message\":\"Customer Profile Failed To Create\"}}}"
      end
    end
  end
end
