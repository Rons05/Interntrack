class InternshipsController < ApplicationController
  before_action :require_login
  before_action :set_internship, only: [:show, :edit, :update, :destroy]

  def index
    @internships = current_user.internships.order(created_at: :desc)
  end

  def show
  end

  def new
    @internship = current_user.internships.new
  end

  def create
    @internship = current_user.internships.new(internship_params)
    if @internship.save
      redirect_to internships_path, notice: "Internship application added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @internship.update(internship_params)
      redirect_to internships_path, notice: "Internship application updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @internship.destroy
    redirect_to internships_path, notice: "Internship application removed."
  end

  private

  def set_internship
    @internship = current_user.internships.find(params[:id])
  end

  def internship_params
    params.require(:internship).permit(:company_name, :role, :status, :date_applied, :notes)
  end
end