require 'rails_helper'

describe ProductsController, type: :controller do


  let(:user) { User.create!(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "Dom", admin: true)}
  let(:user_two) { User.create!(email: "bla@bla.de", password: "654321", id: 2, first_name: "La", last_name: "La", admin: false)}
  let(:product) { Product.create!(name: "dog scarf", description: "warm and cosy", id: 1) }


  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new as admin' do
    before do
      sign_in user
    end
    it 'renders the new template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #new as common user' do
    before do
      sign_in user_two
    end
    it 'redirect to root' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  context 'POST #create' do
    before do
      sign_in user
    end
    it 'renders products page if succesfully created' do
      post :create, params: { product: { name: "basecap", description: "bla", id: 1}}
      expect(response).to redirect_to('/products/1')
    end
  end

  context 'GET #edit as admin' do
    before do
      sign_in user
    end
    it 'renders the edit template' do
      get :edit, params: { id: product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'GET #edit as common user' do
    before do
      sign_in user_two
    end
    it 'redirect to root' do
      get :edit, params: { id: product.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  context 'PATCH #update' do
    before do
      sign_in user
    end
    it 'should update product details' do
      patch :update, params: { id: product.id, product: {description: "new description"}}
      product.reload
      expect(product.description).to eq "new description"
    end
  end

  context 'DELETE #destroy' do
    before do
      sign_in user
    end
    it 'should delete product and redirect to products' do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to products_path
    end
  end

end
