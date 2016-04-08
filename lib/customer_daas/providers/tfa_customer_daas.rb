require 'customer_daas'
require 'jsender'
require 'faraday'
require 'faraday_middleware'

module CustomerDaas
  module Test
    class TfaCustomerDaas < CustomerDaas::Providers::CustomerDaasProvider
      include Jsender

      def initialize(data_source)
      end

      def build_customer(request_params)
        @customer = %Q{ {
        "email_address": "danebalia#{rand(5000)}@codedtrue.com",
        "password": "Murder5Murder6",
        "title": "mr",
        "telephone": "+27836533698",
        "first_name": "Charles",
        "last_name": "Mulder",
        "street": "57 Killarney Street",
        "city": "Oakdale",
        "postal_code": "7530",
        "country": "ZA",
        "receive_newsletters": "true",
        "marketing_referrer": "Other",
        "marketing_other": "Other",
        "verified": "true",
        "id_number":"",
        "vat_number":"",
        "cellphone":"",
        "fax": "",
        "company":"" }
                        }
      end

      def submit_to_data_source
        conn = Faraday.new(:url => 'http://127.0.0.1:9393/')
        output = conn.post do |req|
          req.url 'create_profile'
          req.headers['Content-Type'] = 'application/json'
          req.body = @customer
        end
        output.body
      end
    end
  end
end
