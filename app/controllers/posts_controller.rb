class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    binding.pry
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to root_path
  end
  private
  def post_params
    params.require(:post).permit(:title, :contents).merge(user_id: current_user.id)
  end
end
