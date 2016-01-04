class ArticlesController < ApplicationController
  include StringOpsHelper

  def index
    if params[:q]
      @articles = Article.where("title LIKE ? OR content LIKE ?",
                                "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id]) rescue nil
    if @article
      @article.increment(:number_of_views)
      @article.save
    end

    @new_comment = Comment.new
  end
end
