class StockPick < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  #
  # def update_stock
  #    c_q = self.stock.current_quantity
  #    self.stock.update(current_quantity: c_q - self.quantity)
  #    self.stock.save
  # end


# This should be a validation custom method
# def check_total
#   if self.stock.current_quantity - self.quantity >= 0
#
#   end

end
