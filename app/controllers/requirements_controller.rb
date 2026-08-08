class RequirementsController < ApplicationController
  before_action :require_login

  def index
    @requirements = current_user.requirements.order(created_at: :desc)
  end

  def new
    @requirement = current_user.requirements.new
  end

  def create
    @requirement = current_user.requirements.new(requirement_params)
    if @requirement.save
      redirect_to requirements_path, notice: "Requirement added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @requirement = current_user.requirements.find(params[:id])
    @requirement.update(status: "Uploaded", uploaded_at: Time.current)
    redirect_to requirements_path, notice: "Marked as uploaded!"
  end

  def destroy
    @requirement = current_user.requirements.find(params[:id])
    @requirement.destroy
    redirect_to requirements_path, notice: "Requirement removed."
  end

  private

  def requirement_params
    params.require(:requirement).permit(:name, :status)
  end
end