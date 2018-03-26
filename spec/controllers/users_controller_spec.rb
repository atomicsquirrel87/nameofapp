require 'rails_helper'

describe UsersController, type: :controller do

  let(:user) { User.create!(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "Dom")}
  let(:user_two) { User.create!(email: "bla@bla.de", password: "654321", id: 2, first_name: "La", last_name: "La")}

  describe 'GET #show' do

    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'can not access another users show page' do
      before do
        sign_in user
      end
      it 'redirects to root' do
        get :show, params: { id: user_two.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

  end

end
