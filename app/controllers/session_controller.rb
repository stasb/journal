class SessionController < ApplicationController
  skip_before_filter :check_sign_in, :only => [:new, :create]

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      @account = user.account
      redirect_to account_projects_path(@account), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, :notice => "Logged out!", :class => "alert alert-success"
  end
end
