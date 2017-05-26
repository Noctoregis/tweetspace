class WelcomeController < ApplicationController
  def index 
    @tweet_news = Tweet::get_latest
  end
end