class EntriesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = Entry.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.create(params[:entry])
    if @entry.save
      redirect_to project_path(@project), :notice => "Entry created!"
    else
      render "new"
    end
  end

  def index
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to project_path(@project), :notice => "Entry deleted."
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to project_entry_path(@project, @entry), :notice => "Entry modified."
    else
      render "edit"
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @entry = Entry.find(params[:id])
  end
end
