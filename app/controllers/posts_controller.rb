class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post), notice: "L'article '#{@post.title}' a été créé"
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
