require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  
  describe 'POST auth' do
    it 'assigns the authd user as @user' do
      user = FactoryGirl.create(:user_2)
      post :auth, { username: user.username, password: user.password, format: 'json' }
      expect(assigns(:user)).to eq(user)
    end
  end

end
