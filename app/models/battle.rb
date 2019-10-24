class Battle < ApplicationRecord
    belongs_to :player1, class_name: "User", foreign_key: "player1_id"
    belongs_to :player2, class_name: "User", foreign_key: "player2_id"


    def generator
      player1_chance = rand(1)
      player2_chance = rand(1)

      if player1_chance == 0
      self.player1.stocks.map do |stock|
        stock.update(current_value: stock.current_value - rand(100))
      end
      else
        self.player1.stocks.map do |stock|
        stock.update(current_value: stock.current_value + rand(100))
      end
    end
      if player2_chance == 0
      self.player2.stocks.map do |stock|
        stock.update(current_value: stock.current_value - rand(100))
      end
      else
        self.player2.stocks.map do |stock|
        stock.update(current_value: stock.current_value + rand(100))
      end
    end

    end



    def winner
      if self.player1.total_worth > self.player2.total_worth
      winner = self.player1
      else
      winner = self.player2
      end
    end

    def loser
      if self.player1.total_worth > self.player2.total_worth
      loser = self.player2
      else
      loser = self.player1
      end
    end


    def self.top_five_battles
      if Battle.all.size >= 5
      Battle.all.order(created_at: :desc).first(5)
      else
        Battle.all.order(created_at: :desc).first(Battle.all.size)
      end
    end

    # def update_stocks
    #   self.player1.stocks.map do |stock|
    #     stock.update(initial_value: stock.current_value)
    #   end

    #   self.player2.stocks.map do |stock|
    #     stock.update(initial_value: stock.current_value)
    #   end
    # end

end
