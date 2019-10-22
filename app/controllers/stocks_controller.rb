class StocksController < ApplicationController
  before_action :find_stocks, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = Stock.all

  end



  def show

  @stock_pick = StockPick.new
  end

  private
  def find_stocks
    @stock = Stock.find(params[:id])
  end
end
