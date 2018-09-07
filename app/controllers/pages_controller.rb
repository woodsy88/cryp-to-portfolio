class PagesController < ApplicationController

  def home
    require 'net/http'
    require 'json'

    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI (@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]

  end

  def about

  end

  def lookup
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI (@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)
   
    @symbol = params[:symbol]
    
    if @symbol
      @symbol = @symbol.upcase
    end
    
     if @symbol == ""
      @symbol = "you need to enter a search querry"
    end



  end

end

