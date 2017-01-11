class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Legal was successfully created.' }
      else
        format.html { render :new }
      end
    end  
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tweet.update(legal_params)
        format.html { redirect_to @tweet, notice: 'Legal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
