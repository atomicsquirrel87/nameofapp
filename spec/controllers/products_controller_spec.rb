require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:admin)
    @user2 = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
  end

  context "when search is committed" do
    it "returns products fitting search term" do
		    get :index, params: {q: "Scarf"}
			expect(assigns(:products)).to match_array([@product])
		end
  end

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new as admin' do
    before do
      sign_in @user
    end
    it 'renders the new template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #new as common user' do
    before do
      sign_in @user2
    end
    it 'redirect to root' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  context 'POST #create' do
    before do
      sign_in @user
    end
    it 'renders products page if succesfully created' do
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
  end

  context 'GET #edit as admin' do
    before do
      sign_in @user
    end
    it 'renders the edit template' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'GET #edit as common user' do
    before do
      sign_in @user2
    end
    it 'redirect to root' do
      get :edit, params: { id: @product.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  context 'PATCH #update' do
    before do
      sign_in @user
    end
    it 'should update product details' do
      patch :update, params: { id: @product.id, product: {description: "new description"}}
      @product.reload
      expect(@product.description).to eq "new description"
    end
  end

  context 'DELETE #destroy as admin' do
    before do
      sign_in @user
    end
    it 'should delete product and redirect to products' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
    end
  end

  context 'DELETE #destroy as common user' do
    before do
      sign_in @user2
    end
    it 'redirect to root' do
      delete :destroy, params: { id: @product.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

end
