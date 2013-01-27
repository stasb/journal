class UsersController < ApplicationController
  before_filter :signin_redirect
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.create_account(:name => @user.name, :id => @user.id)
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
