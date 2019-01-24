class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :body, presence: true
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  default_scope { order(created_at: :desc) }
  scope :all_parsed, -> { where.not(body_rendered: nil) }

  def render_body 
    ArticleRendererWorker.perform_async(self.id)
  end
end
