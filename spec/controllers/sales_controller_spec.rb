require 'rails_helper'

RSpec.describe Api::V1::SalesController, type: :controller do
  let(:valid_key) {
    user = FactoryGirl.create(:user_2)
    user.auth(user.password)
    valid_key = user.access_key
  }
  
  describe 'GET show' do
    it 'assigns the requested sale as @sale' do
      sale = FactoryGirl.create(:sale)
      get :show, { id: sale.to_param, access_key: valid_key, format: 'json' }
      expect(assigns(:sale)).to eq(sale)
    end
  end

  describe 'POST create' do
    describe 'with single params' do
      describe 'with valid params' do
        it 'creates a new Sale' do
          expect {
            post :create, { sale: FactoryGirl.attributes_for(:sale), access_key: valid_key, format: 'json' }
          }.to change(Sale, :count).by(1)
        end
        it 'assigns a newly created sale in @sales' do
          post :create, { sale: FactoryGirl.attributes_for(:sale), access_key: valid_key, format: 'json' }
          assigns(:sales).each { |s| expect(s).to be_a(Sale) }
        end
      end
      describe 'with invalid params' do
        it 'does not save a new Sale' do
          post :create, { sale: FactoryGirl.attributes_for(:sale, code: 'a'), access_key: valid_key, format: 'json' }
          assigns(:sales).each { |s| expect(s).to be_a_new(Sale) }
        end
      end
    end

    describe 'with multiple params' do
      describe 'with valid params' do
        it 'creates new Sales' do
          sales = []
          num = 10
          num.times { |n| sales.push FactoryGirl.attributes_for(:sale) }

          expect {
            post :create, { sales: sales, access_key: valid_key, format: 'json' }
            assigns(:sales).each { |s| expect(s).to be_a(Sale) }
          }.to change(Sale, :count).by(num)
        end
      end

      describe 'with invalid params' do
        it 'does not save new Sales' do
          sales = []
          num = 10
          num.times { |n| sales.push FactoryGirl.attributes_for(:sale) }
          post :create, { sale: FactoryGirl.attributes_for(:sale, code: 'a'), access_key: valid_key, format: 'json' }
          assigns(:sales).each { |s| expect(s).to be_a_new(Sale) }
        end
      end
    end
  end
 
  describe 'DELETE destroy' do
    it 'destroys the requested sale' do
      sale = FactoryGirl.create(:sale)
      expect {
        delete :destroy, { id: sale.to_param, access_key: valid_key }
      }.to change(Sale, :count).by(-1)
    end
  end

end
