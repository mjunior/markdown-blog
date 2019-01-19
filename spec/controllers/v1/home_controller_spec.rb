require 'rails_helper'

RSpec.describe V1::HomeController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:article) { create(:article) }
    it 'returns http success' do
      get :show, params: { slug: article.slug }  
      expect(response).to have_http_status(:success)
    end

    it 'returns 404'
  end
end
