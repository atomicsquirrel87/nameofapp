require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user) { User.create!(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "Dom", admin: true)}
  let(:product) { Product.create!(name: "dog scarf", description: "warm and cosy", id: 1) }
  let(:order) { Order.create!(user_id: 1, product_id: 1) }

  context 'GET #index' do
    before do
      sign_in user
    end
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

end
