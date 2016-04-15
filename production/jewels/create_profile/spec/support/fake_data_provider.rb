require 'soar_customer'

class FakeDataProvider < SoarCustomer::HapiProvider
  def initialize(configuration)
    @broken = true if configuration.has_key?('broken')
    super
  end

  def authenticate(credentials)
    super
  end

  def create_profile(customer)
    raise StandardError if @broken 
    "{\"status\":\"success\",\"data\":{\"message\":\"Customer Profile Created\",\"client_id\":\"C0345194416\"}}"
  end
end