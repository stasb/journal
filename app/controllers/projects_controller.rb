class ProjectsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @project = @account.projects.new
  end

  def create
    @account = Account.find(params[:account_id])
    @project = @account.projects.create(params[:project])
    if @project.save
      redirect_to account_projects_path(@account), :notice => "Project created!"
    else
      render "new"
    end
  end

  def index
    @account = @current_user.account
    @projects = @account.projects.all
  end

  def destroy
  end

  def show
    @account = @current_user.account
    @project = Project.find(params[:id])
  end
end
