class ArticleRendererWorker
  include Sidekiq::Worker

  def perform(article_id)
    article = Article.find_by(id: article_id)
    return if article.nil?

    html = ParserService.new(article.body).html
    resume = ParserService.new(article.body).preview

    article.update!({body_rendered: html, resume: resume})
  end
end
