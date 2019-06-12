class AddDefaultOfferValueToApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :applications, :offered, :boolean, :default => false
  end
end
