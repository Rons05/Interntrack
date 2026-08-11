class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = current_user.projects.order(deadline: :asc)
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @project = current_user.projects.find(params[:id])
    @project.update(completed: !@project.completed)
    redirect_to projects_path, notice: "Project updated!"
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project removed."
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline)
  end
end