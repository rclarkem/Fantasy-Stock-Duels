class WelcomeController < ApplicationController

    def home
        @users = User.all
        @stocks = Stock.all
        @battles = Battle.all
    end
end
