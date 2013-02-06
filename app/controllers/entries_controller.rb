class EntriesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
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
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
