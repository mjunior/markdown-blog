class V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end
end
