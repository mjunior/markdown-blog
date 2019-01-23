class V1::HomeController < ApplicationController
  def index
    @articles = ArticleDecorator.collection(Article.all.paginate(page: params[:page]))
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @article = ArticleDecorator.new(Article.friendly.find(params[:slug]))
  end
end
