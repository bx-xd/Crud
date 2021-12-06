class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), notice: "Le commentaire n'a pas pu être enregistré"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
