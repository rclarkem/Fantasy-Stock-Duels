class StockPicksController < ApplicationController
  before_action :find_stock_picks, only: [:show, :edit, :update, :destroy]

  def new
    @stock_pick = StockPick.new
    # byebug
    # @stock_price = Stock.find
  end

  def create
    @stock_pick = StockPick.create(params_stock_pick)
    # byebug
    if @stock_pick.valid?
      if @stock_pick.stock.current_quantity - @stock_pick.quantity >= 0
      curr_quan = @stock_pick.stock.current_quantity
      @stock_pick.stock.update(current_quantity: curr_quan - @stock_pick.quantity)
      redirect_to  stock_pick_path(@stock_pick)
      end
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
