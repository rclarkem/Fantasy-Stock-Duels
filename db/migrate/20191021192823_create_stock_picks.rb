class CreateStockPicks < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_picks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :quantity
      t.integer :value

      t.timestamps
    end
  end
end
