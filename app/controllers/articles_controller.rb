class ArticlesController < ApplicationController
  include StringOpsHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) rescue nil
  end
end
