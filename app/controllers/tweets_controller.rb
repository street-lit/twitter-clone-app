class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    authenticate_user!
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def create
    authenticate_user!
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to @tweet, notice: "New Post successfully created"
    else
      flash[:alert] = "Error Occurred"
      render :new
    end
  end

  def edit
    authenticate_user!
    @tweet = Tweet.find(params[:id])
  end

  def update
    authenticate_user!
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet, notice: 'Tweet successfully updated'
    else
      flash[:alert] = "An error occurred"
      render :edit
    end
  end

  def destroy
    authenticate_user!
    Tweet.destroy(params[:id])
    redirect_to tweets_path, notice: 'destroyed'
  end

  private
    def tweet_params
      params.require(:tweet).permit(:title, :message, :user_id)
    end
end
