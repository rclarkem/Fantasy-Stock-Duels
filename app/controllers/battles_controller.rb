class BattlesController < ApplicationController
    before_action :find_battle, only: [:show, :fight]

    def index
      # byebug
        @battles = Battle.all

    end

    def show

    end

    def new
        @battle = Battle.new
    end

    def create
        @battle = Battle.create(battle_params)
        @battle.generator
        redirect_to @battle
    end

    private

    def battle_params
        params.require(:battle).permit(:player1_id, :player2_id)
    end

    def find_battle
        @battle = Battle.find(params[:id])
    end

end
