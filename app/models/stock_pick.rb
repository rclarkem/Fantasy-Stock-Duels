class StockPick < ApplicationRecord
  belongs_to :user
  belongs_to :stock

validate :check_quantity
  validate :check_balance




  def check_quantity
    if self.quantity == nil
      errors.add(:quantity, "Needs to be greater than 0")
    elsif self.quantity > self.stock.current_quantity
      errors.add(:quantity, "Aren't you greedy? There isn't enough stock to go around for that purchase, big spender!")
    end
  end


def check_balance
  # byebug
  if self.quantity != nil
    if self.user.cash_remaining < (self.stock.initial_value * self.quantity)
    errors.add(:initial_value, "Nice try! You don't have enough money for that purchase, bud.")
    end
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
