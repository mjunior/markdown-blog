class ArticleRendererWorker
  include Sidekiq::Worker

  def perform(article_id)
    article = Article.find_by(id: article_id)
    return if article.nil?
    renderer = Redcarpet::Render::HTML.new({escape_html: true})
    markdown = Redcarpet::Markdown.new(renderer,{})
    html = markdown.render(article.body)
    article.update!(body_rendered: html)
  end
end
