class Stock < ApplicationRecord
    has_many :stock_picks
    has_many :users, through: :stock_picks


    def self.trending_stock
      self.all.max_by { |stock| stock.stock_picks.count}
    end
