class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :notifications, dependent: :destroy
  has_many :projects, dependent: :destroy 
  has_many :applications, dependent: :destroy
end
