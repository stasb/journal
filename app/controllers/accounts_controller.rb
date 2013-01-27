class AccountsController < ApplicationController
  def show
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @account = @current_user.account
  end
end
