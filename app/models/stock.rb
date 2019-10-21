class Stock < ApplicationRecord
    has_many :stock_picks
    has_many :users, through: :stock_picks
end
