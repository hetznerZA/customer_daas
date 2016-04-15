require 'spec_helper'
require 'byebug'

describe SoarSc::Web::Models::Customer do
  before :each do
    @configuration = { 'adaptor' => 'FakeDataProvider',
                       'username' => 'admin',
                       'password' => 'admin',
                       'server_url' => 'http://localhost:9292' }
    @iut = setup_iut(@configuration)
    @customer_info = get_customer_dto
    @provider_response = get_provider_response
    @failed_response = {"status"=>"fail", "data"=>{"result"=>nil, "notifications"=>["Exception while trying to create profile"]}}
    SoarSc::Web::Models::Customer.send(:public, *SoarSc::Web::Models::Customer.protected_instance_methods)
  end

  context 'when initialzing with a configuration' do
    it 'should raise an exception if the configuration is empty' do
      expect {SoarSc::Web::Models::Customer.new({})}.to raise_error(
      SoarSc::Web::Models::Customer::SoarCustomerDaasError, 'No configuration')
    end
    it 'should remember the configuration' do
      expect(@iut.configuration).to eq(@configuration)
    end

    it 'should contain a username for the datastore' do
      expect(@iut.configuration.key?('username')).to eq true
    end

    it 'should contain a password for the datastore' do
      expect(@iut.configuration.key?('password')).to eq true
    end

    it 'should contain the adaptor for the datastore' do
      expect(@iut.configuration.key?('adaptor')).to eq true
    end

    it 'should contain the server url for the datastore' do
      expect(@iut.configuration.key?('server_url')).to eq true
    end

    it 'should raise an exception if no username' do
      configuration = { 'adaptor' => 'SoarCustomer::HapiProvider',
                        'password' => 'admin',
                        'server_url' => 'http://localhost:9292' }
      expect {SoarSc::Web::Models::Customer.new(configuration)}.to raise_error(
      SoarSc::Web::Models::Customer::SoarCustomerDaasError, 'Missing username')
    end

    it 'should raise an exception when the password is empty' do
      configuration = { 'adaptor' => 'SoarCustomer::HapiProvider',
                        'username' => 'admin',
                        'server_url' => 'http://localhost:9292' }
      expect {SoarSc::Web::Models::Customer.new(configuration)}.to raise_error(
      SoarSc::Web::Models::Customer::SoarCustomerDaasError, 'Missing password')
    end

    it 'should raise an exception when the adaptor is empty' do
      configuration = { 'username' => 'admin',
                        'password' => 'admin',
                        'server_url' => 'http://localhost:9292' }
      expect {SoarSc::Web::Models::Customer.new(configuration)}.to raise_error(
      SoarSc::Web::Models::Customer::SoarCustomerDaasError, 'Missing adaptor')
    end

    it 'should raise an exception when the server url is empty' do
      configuration = { 'adaptor' => 'SoarCustomer::HapiProvider',
                        'username' => 'admin',
                        'password' => 'admin' }
      expect {SoarSc::Web::Models::Customer.new(configuration)}.to raise_error(
      SoarSc::Web::Models::Customer::SoarCustomerDaasError, 'Missing server url')
    end

    it 'should remember the configuration provided' do
      expect(@iut.configuration).to eq @configuration
    end

    it 'should load the correct provider' do
      expect(@iut.data_provider.class).to eq FakeDataProvider
    end

    it 'should be store the authentication details' do
      expect(@iut.authenticate).to eq true
    end
  end

  context 'when creating the profile' do
    it 'should submit the request to the data provider' do
      expect_any_instance_of(FakeDataProvider).to receive(:create_profile).with(@customer_info)
      response = @iut.create_profile(@customer_info)
    end

    it 'should notify if the profile has been created' do
      response = @iut.create_profile(@customer_info)
      expect(JSON.parse(response)['status']).to eq "success"
    end

    it 'should return a handled exception if an unknown exception occurs' do
      broken_config = { 'adaptor' => 'FakeDataProvider',
                         'username' => 'admin',
                         'password' => 'admin',
                         'server_url' => 'http://localhost:9292',
                         'broken' => '' }
      iut = SoarSc::Web::Models::Customer.new(broken_config) 
      expect(iut.create_profile(@customer_info)).to eq @failed_response
    end

    it 'should return a jsend format response if the response was a success' do
      pending 'TODO'
    end

    it 'should return a jsend format response if the response was a failure' do
      pending 'TODO'
    end
  end
end

def setup_iut(configuration)
  SoarSc::Web::Models::Customer.new(configuration)
end

def get_customer_dto
  %Q{ {
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

def get_provider_response
  "{\"status\":\"success\",\"data\":{\"message\":\"Customer Profile Created\",\"client_id\":\"C0345194416\"}}"
end
