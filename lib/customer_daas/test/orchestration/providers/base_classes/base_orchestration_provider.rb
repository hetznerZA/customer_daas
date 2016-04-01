module CustomerDaas
  module Test
    class BaseOrchestrationProvider
      def setup
        @notifications = []
        @configuration_service = CustomerDaas::Test::StubConfigurationService.new
      end

      def inject_iut(iut)
        @iut = iut
      end

      def process_result(result)
        @result = result

        @notifications.push(@result['data']['notifications']) if @result and @result.is_a?(Hash) and @result['data'] and @result['data'].is_a?(Hash) and @result['data']['notifications']
        @notifications << @result if @result and not @result.is_a?(Hash)
        @notifications.flatten!
      end

      def success?
        (not @result.nil?) and (not @result['status'].nil?) and (@result['status'] == 'success')
      end

      def data
        @result['data']
      end

      def arrays_the_same?(a, b)
        c = a - b
        d = b - a
        (c.empty? and d.empty?)
      end

      def has_received_notification?(message)
        if @accept_failure_notifications_in_production
          @accept_failure_notifications_in_production = false
          return true
        end
        @notifications.each do |notification|
          #puts "COMPARING #{notification} with #{message}"
          return true if notification == message
        end
        false
      end
    end
  end
end
