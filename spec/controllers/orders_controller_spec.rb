require 'rails_helper'

describe OrdersController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    sign_in @user
  end

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

end
