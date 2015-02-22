require 'rails_helper'

RSpec.describe Api::V1::SalesController, type: :routing do
  let(:valid_domain) { 'http://api.example.com' }
  let(:invalid_domain) { 'http://wrong.example.com' }
  
  describe 'routing' do
    it 'routes to #show' do
      expect(get: "#{ valid_domain }/v1/sales/1").to route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
      expect(get: "#{ valid_domain }/v1/sales/1.json").to route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
      expect(get: "#{ invalid_domain }/v1/sales/1").to_not route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
      expect(get: "#{ invalid_domain }/v1/sales/1.json").to_not route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
      expect(post: "#{ valid_domain }/v1/sales/1").to_not route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
      expect(patch: "#{ valid_domain }/v1/sales/1").to_not route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
      expect(delete: "#{ valid_domain }/v1/sales/1").to_not route_to('api/v1/sales#show', id: '1', format: 'json', subdomain: 'api')
    end
    
    it 'routes to #create' do
      expect(post: "#{ valid_domain }/v1/sales").to route_to('api/v1/sales#create', format: 'json', subdomain: 'api')
      expect(post: "#{ valid_domain }/v1/sales.json").to route_to('api/v1/sales#create', format: 'json', subdomain: 'api')
      expect(post: "#{ invalid_domain }/v1/sales.json").to_not route_to('api/v1/sales#create', format: 'json', subdomain: 'api')
      expect(get: "#{ valid_domain }/v1/sales").to_not route_to('api/v1/sales#create', format: 'json', subdomain: 'api')
      expect(patch: "#{ valid_domain }/v1/sales").to_not route_to('api/v1/sales#create', format: 'json', subdomain: 'api')
      expect(delete: "#{ valid_domain }/v1/sales").to_not route_to('api/v1/sales#create', format: 'json', subdomain: 'api')
    end
    
    it 'routes to #destroy' do
      expect(delete: "#{ valid_domain }/v1/sales/1").to route_to('api/v1/sales#destroy', id: '1', format: 'json', subdomain: 'api')
      expect(delete: "#{ valid_domain }/v1/sales/1.json").to route_to('api/v1/sales#destroy', id: '1', format: 'json', subdomain: 'api')
      expect(get: "#{ valid_domain }/v1/sales/1").to_not route_to('api/v1/sales#destroy', id: '1', format: 'json', subdomain: 'api')
      expect(patch: "#{ valid_domain }/v1/sales/1").to_not route_to('api/v1/sales#destroy', id: '1', format: 'json', subdomain: 'api')
      expect(post: "#{ valid_domain }/v1/sales/1").to_not route_to('api/v1/sales#destroy', id: '1', format: 'json', subdomain: 'api')
    end
  end
  
end