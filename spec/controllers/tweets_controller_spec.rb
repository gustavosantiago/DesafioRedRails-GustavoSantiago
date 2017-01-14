require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  it "should create a tweet" do
    user = FactoryGirl.create(:user)

    tweet = Tweet.new(
      content: "Lorem ypsum",
      user_id: user.id
    )

    expect(tweet.save).to_not be false
  end

end
