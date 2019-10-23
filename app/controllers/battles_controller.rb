class BattlesController < ApplicationController
    before_action :find_battle, only: [:show]

    def index
        @battles = Battle.all
    end

    def show
        
    end

    private

    def find_battle
        @battle = Battle.find(params[:id])
    end

end
