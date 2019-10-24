class User < ApplicationRecord
    has_many :stock_picks
    has_many :stocks, through: :stock_picks

    has_many :battles_as_player1, foreign_key: :player1_id, class_name: "Battle", dependent: :destroy
    has_many :player2s, through: :battles_as_player1, source: :player2

    has_many :battles_as_player2, foreign_key: :player2_id, class_name: "Battle", dependent: :destroy
    has_many :player1s, through: :battles_as_player2, source: :player1

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :wealth, presence: true, numericality: true
    validates :about_me, presence: true
    validates :photo_url, presence: true




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

    def cash_remaining
      total_cost = self.stock_picks.map do |stock_pick|
        stock_pick.quantity * stock_pick.stock.current_value
      end

      total_cost_reduced = total_cost.reduce(0) do |sum, wealth|
        sum + wealth
      end 

      new_wealth = self.wealth - total_cost_reduced
    end

    def update_wealth
      self.update(wealth: cash_remaining)
    end


    def quantity_of_stocks
    stock_quantity = {}
      self.stock_picks.map do |stock_pick|
        if stock_quantity[stock_pick.stock.name]
          stock_quantity[stock_pick.stock.name] += stock_pick.quantity
        else
          stock_quantity[stock_pick.stock.name] = stock_pick.quantity
        end
      end
      stock_quantity
    end


end
