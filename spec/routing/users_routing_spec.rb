require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :routing do
  let(:valid_domain) { 'http://api.example.com' }
  let(:invalid_domain) { 'http://wrong.example.com' }
  
  describe 'routing' do
    it 'routes to #auth' do
      expect(post: "#{ valid_domain }/v1/auth").to route_to('api/v1/users#auth', format: 'json', subdomain: 'api')
      expect(get: "#{ valid_domain }/v1/auth").to_not route_to('api/v1/users#auth', format: 'json', subdomain: 'api')
      expect(post: "#{ invalid_domain }/v1/auth").to_not route_to('api/v1/users#auth', format: 'json', subdomain: 'api')
    end
  end
  
end