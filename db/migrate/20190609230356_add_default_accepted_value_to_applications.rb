class AddDefaultAcceptedValueToApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :applications, :accepted, :boolean, :default => false
  end
end
