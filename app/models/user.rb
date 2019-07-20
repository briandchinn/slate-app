class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :notifications, dependent: :destroy
  has_many :projects, dependent: :destroy 
  has_many :applications, dependent: :destroy

  def has_applied(project_id)
    if applications.find_by(project_id: project_id) 
      return true
    else
      return false
    end
  end

  def user_has_projects
    if projects.length > 0
      return true
    else
      return false
    end
  end

end
