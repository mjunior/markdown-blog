class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :body, presence: true
  def render_body 
    ArticleRendererWorker.perform_async(self.id)
  end
end
