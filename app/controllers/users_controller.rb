class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all.order('created_at DESC')
  end

  def show; end

  def find_user
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end
end
