class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.following << user unless current_user.following.include?(user)
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    current_user.following.delete(user)
    redirect_to user_path(user)
  end
end
