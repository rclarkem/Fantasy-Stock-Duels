class StocksController < ApplicationController
  before_action :find_stocks, only: [:show, :destroy]
  before_action :all_stocks, only: [:index, :edit, :update]

  def index

  end



  def show

  @stock_pick = StockPick.new
  end

  def edit
    
  end

  def update
    
  end

  private
  def find_stocks
    @stock = Stock.find(params[:id])
  end

  def all_stocks
    @stocks = Stock.all
  end
end
