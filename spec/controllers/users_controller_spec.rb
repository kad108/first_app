require 'rails_helper'

describe UsersController, type: :controller do

  # let(:user) { User.create!(email: 'test-email@mail.com', password: 'test-password')}
  # let(:user2) { User.create!(email: 'test-email2@mail.com', password: 'test-password')}
  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  describe 'GET #show' do
    context 'User is logged in' do
      before do
        sign_in @user
      end

      it 'Loads correct user details' do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'User cannot see others page' do
      before do
        sign_in @user2
      end

      it 'redirects to root path' do
        get :show, params: { id: @user.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end