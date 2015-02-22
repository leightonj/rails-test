require 'rails_helper'

RSpec.describe 'Sales', type: :request do
  #http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
  before(:each) do
    host! 'api.example.com'
    user = FactoryGirl.create(:user_2)
    user.auth(user.password)
    
    @valid_key = user.access_key
    @invalid_key = 'bad ting'
  end
  
  describe 'GET /sale/1' do
    describe 'with valid sale' do
      sale = FactoryGirl.create(:sale)
      
      it 'returns unauthorized without a valid key' do
        get api_v1_sale_path(sale, format: 'json')
        expect(response.status).to be(403)
        
        get api_v1_sale_path(sale, access_key: @invalid_key, format: 'json')
        expect(response.status).to be(403)
      end
      
      it 'renders the show template and ok status with a valid key' do
        get api_v1_sale_path(sale, access_key: @valid_key, format: 'json')
        expect(response).to render_template(:show)
        expect(response.status).to be(200)
      end
    end
    
    describe 'with invalid sale' do
      it 'renders 404' do
        get api_v1_sale_path(-1, access_key: @valid_key, format: 'json')
        expect(response.status).to be(404)
      end
    end
    
  end
end