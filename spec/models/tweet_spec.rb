# == Schema Information
#
# Table name: tweets
#
#  id                 :integer          not null, primary key
#  content            :text
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it "should have a valid content" do
    user = FactoryGirl.create(:user)

    tweet = Tweet.new(user_id: user.id, content: "Lorem")

    tweet.valid?

    expect(tweet.errors[:content].size).to eq(1)
  end 
end
