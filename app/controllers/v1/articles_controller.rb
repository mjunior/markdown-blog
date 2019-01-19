class V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      @article.render_body
      redirect_to v1_article_path(@article), notice: 'Foi'
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
