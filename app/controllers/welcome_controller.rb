class WelcomeController < ApplicationController
  def index
    @popular_tweets = Tweet.all.sort_by { |tweet| tweet.comments.count }.reverse.take(3)
  end
end
