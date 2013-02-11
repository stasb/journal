class ProjectsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @project = @account.projects.new
  end

  def edit
    @account = Account.find(params[:account_id])
    @project = Project.find(params[:id])
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
    @account = @current_user.account
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to account_projects_path(@account), :notice => "Project deleted."
  end

  def update
    @account = Account.find(params[:account_id])
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to account_project_path(@account, @project), :notice => "Project modified."
    else
      render "edit"
    end
  end

  def show
    @account = @current_user.account
    @project = Project.find(params[:id])
    @entries = @project.entries.all
  end
end
