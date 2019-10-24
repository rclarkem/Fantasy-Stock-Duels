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

    # def randomizer
    #   rand(1)
    # end

    # def self.go_forward_in_time
    #   Stock.all.map do |stock|
    #     if stock.randomizer == 0
    #       stock.update(initial_value: stock.initial_value - rand(100))
    #     else
    #     stock.update(initial_value: stock.initial_value + rand(100))
    #     end
    #   end
    # end

end
