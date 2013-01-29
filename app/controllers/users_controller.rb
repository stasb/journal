class UsersController < ApplicationController
  skip_before_filter :check_sign_in, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.create_account(:name => @user.name, :id => @user.id)
      session[:user_id] = @user.id
      @account = @user.account
      redirect_to account_projects_path(@account), :notice => "Signed up!"
    else
      render "new"
    end
  end
end
