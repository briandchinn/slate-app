class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :application_id
      t.string :note

      t.timestamps
    end
  end
end
