class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end

  def show; end

  def find_post
    @user = User.find(params[:user_id])

    @post = Post.find(params[:id])
  end
end
