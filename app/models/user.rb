class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :notifications
  has_many :projects
  has_many :applications
end
