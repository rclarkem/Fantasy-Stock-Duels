class CreateStockPicks < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_picks do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :stock, null: false, foreign_key: true
      t.integer :quantity
      t.integer :value

      t.timestamps
    end
  end
end
