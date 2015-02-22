require 'rails_helper'

RSpec.describe 'Users', type: :request do
  #http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
  before(:each) do
    host! 'api.example.com'
  end
  
  describe 'POST /auth' do
    describe 'with invalid params' do
      it 'renders 401 without all correct params' do
        post api_v1_auth_path
        expect(response.status).to be(401)
        
        user = FactoryGirl.create(:user_2)
        
        post api_v1_auth_path(username: user.username)
        expect(response.status).to be(401)
        
        post api_v1_auth_path(password: user.password)
        expect(response.status).to be(401)
        
        post api_v1_auth_path(username: user.username, password: '')
        expect(response.status).to be(401)
      end
    end
    
    describe 'with valid params' do
      it 'Renders the auth template and ok status' do
        user = FactoryGirl.create(:user_2)
        post api_v1_auth_path(username: user.username, password: user.password)
        expect(response).to render_template(:auth)
        expect(response.status).to be(200)
      end
    end
  end
end