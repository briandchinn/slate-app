class Project < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :users, through: :applications

  def accepted_count
    applications.where(accepted:true).count
  end

  def creator_full_name
    "#{user.first_name} #{user.last_name} "
  end

  def remaining_positions
    number_of_positions - applications.where(accepted:true).count
  end
  
end
