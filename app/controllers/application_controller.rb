class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
    unless current_user
      flash[:notice] = "You must sign in first!"
      redirect_to root_path
    end
  end

  def authenticate_user_for_action!(content)
    unless current_user.admin? || current_user == content.user
      flash[:notice] = "You aren't authorized to do that."
      redirect_to root_path
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
