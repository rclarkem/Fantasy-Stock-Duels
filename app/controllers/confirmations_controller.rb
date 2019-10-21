class ConfirmationsController < ApplicationController

  def show
    @user = User.find[:id]
  end
end
