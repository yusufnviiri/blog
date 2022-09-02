class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(@comment.user_id, @comment.post_id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end
