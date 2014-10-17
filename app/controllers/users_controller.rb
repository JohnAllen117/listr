class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(current_user)
    redirect_to root_path, notice: "Sorry to see you go!"
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :provider, :uid, :name, :oauth_token, :oauth_expires_at, :image)
  end
end
