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
end
