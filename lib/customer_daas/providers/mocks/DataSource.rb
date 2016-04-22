module CustomerDaas
  module Test
    class DataSource
      attr_reader :break

      def initialize
        @break = false 
      end

      def create_profile(customer)
        raise StandardError('Failed for some reason') if @break
        '{"profile":{"client_number":"C0345194416"}}'
      end

      def break_response
        @break = true
      end
    end
  end
end
