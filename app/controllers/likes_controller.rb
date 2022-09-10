class LikesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.user_id = params[:user_id]
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_path(@like.user_id, @like.post_id)
    else
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit!
  end
end
