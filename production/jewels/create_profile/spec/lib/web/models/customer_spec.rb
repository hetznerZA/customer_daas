require 'spec_helper'
require 'byebug'

describe SoarSc::Web::Models::Customer do
  before :each do
    @configuration = { 'adaptor' => 'FakeDataProvider',
                       'username' => 'admin',
                       'password' => 'admin',
                       'server_url' => 'http://localhost:9292' }
    setup_iut(@configuration)
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

    it 'should be able to authorize against the provider' do
      expect(@iut.authenticate).to eq true
    end
  end

  context 'should create the profile' do

  end

  context 'should translate/formate the response from profile creation' do
    pending('TODO')
  end
end

def setup_iut(configuration)
  @iut = SoarSc::Web::Models::Customer.new(configuration)
end
