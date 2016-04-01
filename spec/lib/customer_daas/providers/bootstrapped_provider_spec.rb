require 'byebug'
require 'spec_helper'

  describe "CustomerDaas::Providers::CustomerDaasProvider" do
    before :each do
      @configuration_service = CustomerDaas::Test::StubConfigurationService.new
      @iut = CustomerDaas::Providers::CustomerDaasProvider.new
    end

  context "customer profile creation" do
  end
end
