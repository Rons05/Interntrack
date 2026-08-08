class Requirement < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: ["Pending", "Completed"] }
end
