class User < ApplicationRecord
  has_secure_password
  has_many :journals
  has_many :logs
  has_many :requirements
  has_many :projects
  validates :username, presence: true, uniqueness: true
end
