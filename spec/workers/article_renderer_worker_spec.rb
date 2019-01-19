require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe ArticleRendererWorker, type: :worker do
  context "When a message arrives" do
    let(:article) { create(:article)}
    it 'renderer correct html' do
      Sidekiq::Testing.inline! do
        ArticleRendererWorker.perform_async(article.id)
        expect(article.reload.body_rendered).to eql("<p>This is <em>bongos</em>, indeed.</p>\n")  
      end
    end
  end
end
