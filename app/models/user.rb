class User < ApplicationRecord
    has_many :stock_picks
    has_many :stocks, through: :stock_picks

    has_many :battles_as_player1, foreign_key: :player1_id, class_name: "Battle", dependent: :destroy
    has_many :player2s, through: :battles_as_player1, source: :player2

    has_many :battles_as_player2, foreign_key: :player2_id, class_name: "Battle", dependent: :destroy
    has_many :player1s, through: :battles_as_player2, source: :player1

    has_secure_password



def total_worth
  self.stocks.reduce(0) {|sum, stock| sum + stock.current_value}
end

def best_stock
  self.stocks.max_by { |stock| stock.current_value}
end


end
