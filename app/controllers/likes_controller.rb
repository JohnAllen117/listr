class LikesController < ApplicationController
  before_action :signed_in?

  def create
    @like = Like.new(user_id: params[:user_id], list_id: params[:list_id])
    if !@like.save
      flash[:notice] = "Oops!"
    end
    redirect_to list_path(params[:list_id])
  end

  def destroy
    @like = Like.find_by(user_id: params[:user_id], list_id: params[:list_id])
    @list = @like.list
    authenticate_user_for_action!(@like)

    Like.destroy(@like)

    redirect_to list_path(@list)
  end
end
