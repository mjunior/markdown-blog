class Article < ApplicationRecord
  validates :title, :body, presence: true

  def render_body 
    ArticleRendererWorker.perform_async(self.id)
  end
end
