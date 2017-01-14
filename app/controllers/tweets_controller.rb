class TweetsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
        
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to user_activities_path(current_user), notice: 'tweet was successfully created.' }
      else
        format.html { render :new }
      end
    end  
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :photo)
    end
end
