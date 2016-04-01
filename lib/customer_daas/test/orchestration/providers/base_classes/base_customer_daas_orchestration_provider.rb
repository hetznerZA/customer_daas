module CustomerDaas
  module Test
    class BaseCustomerDaasOrchestrationProvider < BaseOrchestrationProvider
      def given_a_request_for_customer_creation
      end

      def  build_a_customer_from_request_params
      end

      def forward_request_to_relevant_service
      end

      def customer_profile_has_been_submitted
      end

      def validate_response_before_returning
      end

      def return_success_response 
      end

      def return_fail_response
      end
    end
  end
end
