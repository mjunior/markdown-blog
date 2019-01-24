class V1::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      @article.render_body
      redirect_to v1_articles_path, notice: 'Sucesso'
    else
      render :new
    end
  end

  def index
    @articles = ArticleDecorator.collection(Article.paginate(page: params[:page]))
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body).merge!(author: current_user)
  end
end
