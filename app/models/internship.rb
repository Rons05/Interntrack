class Internship < ApplicationRecord
  belongs_to :user
  validates :company, presence: true
  validates :role, presence: true
  validates :status, presence: true
end
