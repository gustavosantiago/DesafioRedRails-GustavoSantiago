class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets

  validates :content, length: { minimum: 10, maximum: 160 }

  has_attached_file :photo, styles: { thumb: "300x300>", medium: "450x400>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
