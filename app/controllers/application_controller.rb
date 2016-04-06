class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def signed_in?
    session[:user_id].present?
  end
  helper_method :signed_in?

  def current_user
    return if session[:user_id].nil?
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def authenticate_user
    if session[:user_id].nil?
      flash[:alert] = "Sign in to do this!"
      redirect_to sign_in_path
    end
  end
end
