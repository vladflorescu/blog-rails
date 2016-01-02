class Admin::ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
