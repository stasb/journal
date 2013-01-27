class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :check_sign_in

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_sign_in
    unless user_signed_in
      redirect_to log_in_path
    end
  end

  def user_signed_in
    return true if current_user
  end
end
