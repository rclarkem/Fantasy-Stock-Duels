class Stock < ApplicationRecord
    has_many :stock_picks
    has_many :users, through: :stock_picks

# validates :current_value, numer

    def self.trending_stock
      if Stock.all.size >= 5
      Stock.all.order(current_value: :desc).first(5)
      else
        Stock.all.order(current_value: :desc).first(Stock.all.size)
      end

    end

    # def update_stock
    #   self.update(initial_value: self.current_value)
    # end

end
