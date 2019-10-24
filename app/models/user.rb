class User < ApplicationRecord
    has_many :stock_picks
    has_many :stocks, through: :stock_picks

    has_many :battles_as_player1, foreign_key: :player1_id, class_name: "Battle", dependent: :destroy
    has_many :player2s, through: :battles_as_player1, source: :player2

    has_many :battles_as_player2, foreign_key: :player2_id, class_name: "Battle", dependent: :destroy
    has_many :player1s, through: :battles_as_player2, source: :player1

    has_secure_password

    # def cash_remaining
    #   stock_pick = StockPick.find(@stock_pick.id)
    #   self.wealth - (self.stock_pick.quantity * @stock_pick.stock.current_value)
    # end



    def all_battles
      self.battles_as_player1 + self.battles_as_player2
    end


    def battles_won
      self.all_battles.select {|battle| battle.winner == self}
    end

    def battles_lost
      self.all_battles.select {|battle| battle.loser == self}
    end


    def total_worth
      value = self.stock_picks.map { |stock_pick| stock_pick.quantity * Stock.find(stock_pick.stock_id).current_value}
      value.reduce(0) { |sum, val| sum + val}
    end

    def best_stock
      # tried adding a conditional for the user without
        self.stocks.max_by { |stock| stock.current_value}
    end


end
