class JournalsController < ApplicationController
  before_action :require_login

  def index
    @journals = current_user.journals.order(created_at: :desc)
  end

  def new
    @journal = current_user.journals.new
  end

  def create
    @journal = current_user.journals.new(journal_params)
    if @journal.save
      redirect_to journals_path, notice: "Journal entry added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @journal = current_user.journals.find(params[:id])
    @journal.destroy
    redirect_to journals_path, notice: "Journal entry removed."
  end

  private

  def journal_params
    params.require(:journal).permit(:content)
  end
end