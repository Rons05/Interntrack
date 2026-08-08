class DashboardController < ApplicationController
  before_action :require_login

  def index
    @hours_completed = current_user.logs.sum(:hours)
    @hours_required = current_user.total_hours_required || 240
    @journals = current_user.journals.order(created_at: :desc)
    @recent_logs = current_user.logs.order(date_worked: :desc).limit(5)
    @requirements = current_user.requirements.order(created_at: :desc)
    @journal_count = current_user.journals.count
    @requirements_uploaded = current_user.requirements.where(status: "Uploaded").count
    @requirements_total = current_user.requirements.count
  end

  def update_hours
    current_user.update(total_hours_required: params[:total_hours_required])
    redirect_to root_path, notice: "Hours target updated."
  end
end