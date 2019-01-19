class V1::HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.friendly.find(params[:slug])
  end
end
