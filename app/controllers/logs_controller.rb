class LogsController < ApplicationController
  before_action :require_login

  def index
    @logs = current_user.logs.order(date_worked: :desc)
  end

  def new
    @log = current_user.logs.new
  end

  def create
    @log = current_user.logs.new(log_params)
    if @log.save
      redirect_to logs_path, notice: "Log entry added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @log = current_user.logs.find(params[:id])
    @log.destroy
    redirect_to logs_path, notice: "Log entry removed."
  end

  private

  def log_params
    params.require(:log).permit(:date_worked, :time_in, :time_out)
  end
end