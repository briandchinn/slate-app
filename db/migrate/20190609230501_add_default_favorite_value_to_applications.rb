class AddDefaultFavoriteValueToApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :applications, :favorite, :boolean, :default => false
  end
end
