class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    unless current_user.likes.exists?(post: @post)
      @post.likes.create(user: current_user)
    end
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post: @post)
    @like.destroy if @like
    redirect_to posts_path
  end
end
