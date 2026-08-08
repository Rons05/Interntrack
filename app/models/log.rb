class Log < ApplicationRecord
  belongs_to :user
  validates :date_worked, presence: true
  validates :time_in, presence: true
  validates :time_out, presence: true

  before_save :calculate_hours

  private

  def calculate_hours
    if time_in.present? && time_out.present?
      self.hours = ((time_out - time_in) / 1.hour).round(2)
    end
  end
end