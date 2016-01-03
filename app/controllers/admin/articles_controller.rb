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
      flash[:success_message] = "Article successfuly published."
    else
      flash[:fail_message] = "Article publication error: #{article.errors}."
    end

    redirect_to polymorphic_path([:admin, :articles])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])

    if article.update_attributes(article_params)
      flash[:success_message] = "Article successfuly updated."
    else
      flash[:fail_message] = "Article update error: #{article.errors}."
    end

    redirect_to polymorphic_path([:admin, :articles])
  end

  def destroy
    article = Article.find(params[:id])

    if article.destroy
      flash[:success_message] = "Article successfuly deleted."
    else
      flash[:error_message] = "Article delete error: #{article.errors}."
    end

    redirect_to polymorphic_path([:admin, :articles])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
