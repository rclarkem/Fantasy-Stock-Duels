class Battle < ApplicationRecord
    belongs_to :player1, class_name: "User", foreign_key: "player1_id"
    belongs_to :player2, class_name: "User", foreign_key: "player2_id"


    def winner
      if self.player1.total_worth > self.player2.total_worth
      winner = self.player1.name + "🥇"
      else
        winner = self.player2.name + "🥇"
      end
    end

    # def randomizer
    #   random = rand()
    # end

end
