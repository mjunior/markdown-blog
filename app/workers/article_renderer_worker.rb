class ArticleRendererWorker
  include Sidekiq::Worker

  def perform(article_id)
    article = Article.find_by(id: article_id)
    return if article.nil?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,{})
    html = markdown.render(article.body)
    article.update!(body_rendered: html)
  end
end
