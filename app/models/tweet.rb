class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets

  validates :content, length: { minimum: 10, maximum: 160 }
end
