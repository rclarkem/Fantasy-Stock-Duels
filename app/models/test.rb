class Newer < ApplicationRecord
 require 'news-api'

def search(q, from, sortBy)
  @q = q
  @from = from
  @sortBy = sortBy


end


end
