class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= find_user_from_session
  end
  helper_method :current_user

  def authenticate_user!
    if current_user.nil?
      flash[:alert] = '続けるにはログインしてください。'
      redirect_to new_login_path
    end
  end

  def admin_user!
    redirect_to home_user_path unless current_user.admin?
  end

  private

  def find_user_from_session
    User.id_is(session[:user_id]) if session[:user_id]
  end
end
