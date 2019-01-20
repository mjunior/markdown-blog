require 'rails_helper'

RSpec.describe ArticleDecorator do
  context "When the body isnt rendered" do
    let(:articles) { create_list(:article, 10)}
    it 'returns processing message' do
      decorator = ArticleDecorator.new(articles.sample)
      expect(decorator.body).to match(/Processando/)
    end
  end

  context "Whe the body is rendered" do
    before do
      create_list(:article, 10)
      Article.all.each do |article|
        ArticleRendererWorker.new.perform(article.id)
      end
    end
    it 'returns a html' do
      decorator = ArticleDecorator.new(Article.all.sample)
      expect(decorator.body).to eql("<p>This is <em>bongos</em>, indeed.</p>\n")
    end
  end
end
