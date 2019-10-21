class StockPicksController < ApplicationController
  before_action :find_stock_picks, only: [:show, :edit, :update, :destroy]

  def new
    @stock_pick = StockPick.new
    # @stock_price = Stock.find
  end

  def create
    @stock_pick = StockPick.create(params_stock_pick)
    if @stock_pick.valid?
      redirect_to  @stock_pick.stock
    else
      redirect_to new_stock_pick_path
    end
  end

  def show
    @user = @stock_pick.user
  end



private
  def find_stock_picks
    @stock_pick = StockPick.find(params[:id])
  end

  def params_stock_pick
    params.require(:stock_pick).permit(:user_id, :stock_id, :quantity, :value)
  end

end
