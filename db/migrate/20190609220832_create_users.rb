class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :address
      t.string :phone_number
      t.string :imdb_url
      t.string :resume
      t.string :current_job_title

      t.timestamps
    end
  end
end
