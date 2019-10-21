class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.integer :initial_value
      t.integer :current_value
      t.integer :initial_quantity
      t.integer :current_quantity

      t.timestamps
    end
  end
end
