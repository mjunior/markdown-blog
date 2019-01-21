class V1::ArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      @article.render_body
      redirect_to v1_show_article_path({slug: @article.slug}), notice: 'Foi'
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body).merge!(author: current_user)
  end
end
