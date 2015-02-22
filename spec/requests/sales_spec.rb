require 'rails_helper'

RSpec.describe 'Sales', type: :request do
  #http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
  before(:each) do
    host! 'api.example.com'
  end
  
  describe 'GET /sale/1' do
    describe 'with valid sale' do
      sale = FactoryGirl.create(:sale)
      
      it 'renders the show template and ok status' do
        get api_v1_sale_path(sale, format: 'json')
        expect(response).to render_template(:show)
        expect(response.status).to be(200)
      end
    end
    
    describe 'with invalid sale' do
      it 'renders 404' do
        get api_v1_sale_path(-1, format: 'json')
        expect(response.status).to be(404)
      end
    end
    
  end
end