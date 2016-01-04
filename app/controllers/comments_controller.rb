class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to article_path(Article.find(params[:comment][:article_id]))
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content, :article_id)
  end
end
