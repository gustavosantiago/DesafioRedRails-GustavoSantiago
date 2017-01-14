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

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets

  validates :content, length: { minimum: 10, maximum: 160 }

  has_attached_file :photo, styles: { thumb: "300x300>", medium: "450x400>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
