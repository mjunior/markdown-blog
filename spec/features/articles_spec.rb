require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  describe "#new" do
    before do
      user = create(:user, email: 'aa@aa.com.br', password: 123123, password_confirmation: 123123)
      visit(new_user_session_path)
      fill_in "user_email",	with: "aa@aa.com.br"
      fill_in "user_password",	with: "123123" 
      click_button 'Acessar'
    end

    context "When fill with the valid values" do
      it 'show to the article details' do
        visit(new_v1_article_path)
        fill_in 'article_title', with: 'Meu artigo com titulo'
        fill_in 'article_body', with: 'O corpo do **artigo**'
        click_button 'Publicar'
        expect(page).to have_content(/Todos os artigos/)
      end

      it 'redirect to the correct page' do
        visit(new_v1_article_path)
        fill_in 'article_title', with: 'Meu artigo com titulo'
        fill_in 'article_body', with: 'O corpo do **artigo**'
        click_button 'Publicar'
        expect(page).to have_current_path(v1_articles_path)
      end
    end
  end
end
