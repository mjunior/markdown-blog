require 'rails_helper'

RSpec.describe V1::ArticlesController, type: :controller do
  describe 'GET #new' do
    context 'when signed user' do
      before(:each) do
        user = create(:user)
        sign_in user
      end
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not signed user' do
      it 'return http status 302 ' do
        get :new
        expect(response).to have_http_status(302)
      end
    end
  end
  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        user = create(:user)
        sign_in user
      end
      it 'create a new article' do
        expect{
          post :create, params: {article: attributes_for(:article) }
        }.to change(Article, :count).by(1)
      end
    end
    context 'with invalid params' do
      before(:each) do
        user = create(:user)
        sign_in user
      end
      it 'desnt create a new article' do
        expect{
          post :create, params: {article: attributes_for(:article, title: nil) }
        }.to_not change(Article, :count)
      end
    end
  end
end
