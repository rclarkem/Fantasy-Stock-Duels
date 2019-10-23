class Battle < ApplicationRecord
    belongs_to :player1, class_name: "User", foreign_key: "player1_id"
    belongs_to :player2, class_name: "User", foreign_key: "player2_id"

    def generator
      self.player1.stocks.map do |stock|
        stock.update(current_value: stock.current_value * rand(-5..5))
      end
      self.player2.stocks.map do |stock|
        stock.update(current_value: stock.current_value * rand(-5..5))
      end
      # self.player1.update(total_worth:)
      # self.player2.update(total_worth:)
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

    def randomizer
      random = rand()
    end

end
