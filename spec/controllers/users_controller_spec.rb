require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get user_activities" do
    user = FactoryGirl.create(:user)
    expect(get: "users/#{user.id}/see_tweets").to route_to(
      controller: "users",
      user_id: "#{user.id}",
      action: "see_tweets"
    )
  end


end
