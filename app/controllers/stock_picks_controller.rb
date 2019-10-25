class StockPicksController < ApplicationController
  before_action :find_stock_picks, only: [:show, :edit, :update, :destroy]

  def new
    @stock_pick = StockPick.new
    # byebug
    # @stock_price = Stock.find
  end

  def create
    @stock_pick = StockPick.create(params_stock_pick)
    if @stock_pick.valid?
      @stock_pick.update_stock()
      @stock_pick.user.update(wealth: @stock_pick.user.wealth - (@stock_pick.quantity * @stock_pick.stock.current_value))
      # if @stock_pick.stock.current_quantity - @stock_pick.quantity >= 0
      # curr_quan = @stock_pick.stock.current_quantity
      # @stock_pick.stock.update(current_quantity: curr_quan - @stock_pick.quantity)
    # byebug

      redirect_to  stock_pick_path(@stock_pick)
      # end
    else
      flash[:errors] = @stock_pick.errors.messages.values.flatten.each{|msg| msg}
      # @stock_pick.errors.full_messages
      redirect_to stock_path(@stock_pick.stock)
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
