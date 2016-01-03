class Admin::ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to article
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      redirect_to polymorphic_path([:admin, :articles])
    else

    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
