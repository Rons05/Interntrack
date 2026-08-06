class DashboardController < ApplicationController
  before_action :require_login

  HOURS_REQUIRED = 240

  def index
    @hours_completed = current_user.hours_completed || 0
    @hours_required = HOURS_REQUIRED
    @journals = current_user.journals.order(created_at: :desc)
  end
end