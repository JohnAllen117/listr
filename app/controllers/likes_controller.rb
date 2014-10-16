class LikesController < ApplicationController
  before_action :signed_in?

  def create
    @like = Like.new(user_id: current_user.id, list_id: params[:list_id])
    @like.save ? flash[:notice] = "Liked!" : flash[:notice] = "Oops!"
    redirect_to list_path(params[:list_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, list_id: params[:list_id])
    authenticate_user_for_action!(@like)

    Like.destroy(@like)

    redirect_to list_path(@like.list)
  end
end
