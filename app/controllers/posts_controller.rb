class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.includes(:posts).find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.user_id = @user.id
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def find_post
    @user = User.find(params[:user_id])

    @post = Post.find(params[:id])
  end
end
