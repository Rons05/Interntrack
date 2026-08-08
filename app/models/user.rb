class User < ApplicationRecord
  has_secure_password
  has_many :journals
  has_many :logs
  has_many :requirements
  validates :username, presence: true, uniqueness: true
end
