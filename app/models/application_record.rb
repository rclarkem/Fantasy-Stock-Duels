class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
   # before_action :newsapi
   # requre 'json'
   # require 'rest-client'
   # require 'news-api'

  # newsapi = News.new("66b703b193e04569b54d4bd2a6f6c883")

  # /v2/todef get_all_the_characters
  # Fetch to all 9 pages
  # all_the_characters = Array(1..9).map do |page_num|
    # def tester
    #   response_string = RestClient.get("https://newsapi.org/v2/top- headlines?q=trump&apiKey=66b703b193e04569b54d4bd2a6f6c883")
    #   response_hash = JSON.parse(response_string)
    #   response_hash["results"]
    # end
# endp-headlines
#   top_headlines = newsapi.get_top_headlines(q: 'bitcoin',
#                                             sources: 'bbc-news,the-verge',
#                                             category: 'business',
#                                             language: 'en',
#                                             country: 'us')
end
