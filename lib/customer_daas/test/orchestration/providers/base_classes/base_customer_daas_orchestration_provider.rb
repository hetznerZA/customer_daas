require 'jsender'

module CustomerDaas
  module Test
    class BaseCustomerDaasOrchestrationProvider < BaseOrchestrationProvider
      include Jsender

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
        @valid_jsend_response = {"status"=>"success", "data"=>{"profile"=>{"client_number"=>"C0345194416"}, "notifications"=>["success"]}}
      end

      def given_a_request_for_customer_creation
        @profile_creation_result = {}
        @request_params = @request1[:params]
      end

      def build_a_customer_from_request_params
        @iut.build_customer(@request_params)
        @iut.customer == JSON.parse(@request_params)
      end

      def forward_request_to_data_source
        @iut.submit_to_data_source
        @iut.profile_creation_result.to_s.include?('profile')
      end

      def failed_request
        @iut.break_response
      end

      def customer_profile_has_been_submitted
        @iut.build_customer(@request1[:params])
        forward_request_to_data_source
        @iut.profile_creation_result.to_s.include?('profile')
      end

      def validate_response_before_returning
        JSON.parse(@iut.profile_creation_result)['profile'].has_key?('client_number')
      end

      def return_success_response
        success_data(JSON.parse(@iut.profile_creation_result)['profile']) == @valid_jsend_response
      end

      def return_failed_response
        response = forward_request_to_data_source
         response.to_s.include?('fail') 
      end
    end
  end
end
