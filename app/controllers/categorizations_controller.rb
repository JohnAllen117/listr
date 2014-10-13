class CategorizationsController < ApplicationController
  def new
    @user = User.where(params[:id])
    @list = List.where(params[:list_id])
  end

  def create
    @user = User.where(params[:id])
    @list = List.where(params[:list_id])
  end

  def destroy
    
  end
end
