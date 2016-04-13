require 'soar_customer'

class FakeDataProvider < SoarCustomer::HapiProvider
  def initialize(configuration)
    super
  end

  def authenticate(credentials)
    super
  end
end