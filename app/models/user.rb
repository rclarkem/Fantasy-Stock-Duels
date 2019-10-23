class User < ApplicationRecord
    has_many :stock_picks
    has_many :stocks, through: :stock_picks


    def total_worth
      self.stocks.reduce(0) {|sum, stock| sum + stock.current_value}
    end

    def best_stock
      self.stocks.max_by { |stock| stock.current_value}
    end

end
