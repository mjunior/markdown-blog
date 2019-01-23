class ArticleRendererWorker
  include Sidekiq::Worker

  def perform(article_id)
    article = Article.find_by(id: article_id)
    return if article.nil?

    html = ParserService.new(article.body).html
    article.update!(body_rendered: html)
  end
end
