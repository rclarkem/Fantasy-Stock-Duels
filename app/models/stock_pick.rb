class StockPick < ApplicationRecord
  belongs_to :user
  belongs_to :stock

#

  # validate



  validates :quantity, presence: true
  # validates :quantity, numericality: {less_than:  Stock.find(@stock_pick.stock_id)}

def check_balance
  if self.stock.current_quantity  > 0

  end
end

  def update_stock
    if self.stock.current_quantity - self.quantity >= 0
    curr_quan = self.stock.current_quantity
    self.stock.update(current_quantity: curr_quan - self.quantity)
  end
end
# This should be a validation custom method
# def check_total
#   if self.stock.current_quantity - self.quantity >= 0
#
#   end

end
