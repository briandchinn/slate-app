class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :start_date
      t.string :end_date
      t.integer :number_of_positions
      t.integer :user_id

      t.timestamps
    end
  end
end
