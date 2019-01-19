class ArticleRendererWorker
  include Sidekiq::Worker

  def perform(article_id)
    # Do something
  end
end
