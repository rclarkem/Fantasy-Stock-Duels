class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :wealth, default: 5000
      t.string :about_me
      t.string :photo_url

      t.timestamps
    end
  end
end
