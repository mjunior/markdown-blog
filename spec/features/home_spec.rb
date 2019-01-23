require 'rails_helper'

RSpec.feature "Home", type: :feature do
  describe "When access the index" do
    before do
      create_list(:article, 10)
      Article.all.each do |article|
        ArticleRendererWorker.new.perform(article.id)
      end
    end
    it 'render the title Todos os artigos' do
      visit(root_path)
      expect(find('h1').text).to match(/Todos os artigos/)
    end
    it 'render all articles' do
      visit(root_path)
      expect(find_all('.article-title').size).to eql(10)
    end
  end
end
