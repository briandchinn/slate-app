class Application < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :notifications
end
