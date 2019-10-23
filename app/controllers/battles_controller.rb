class BattlesController < ApplicationController
    before_action :find_battle, only: [:show]

    def index
      # byebug
        @battles = Battle.all

    end

    def show
      @battle.winner()
      # if @battle.player1.total_worth > @battle.player2.total_worth
      #   @winner = @battle.player1.name
      # else
      #  @winner = @battle.player2.name
      # end
    end

    private

    def find_battle
        @battle = Battle.find(params[:id])
    end

end
