class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :note
      t.boolean :offered
      t.boolean :accepted
      t.boolean :favorite

      t.timestamps
    end
  end
end
