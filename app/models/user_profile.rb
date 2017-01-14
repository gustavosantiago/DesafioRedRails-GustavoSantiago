# == Schema Information
#
# Table name: user_profiles
#
#  id                  :integer          not null, primary key
#  name                :string
#  user_id             :integer
#  bio                 :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class UserProfile < ApplicationRecord
  belongs_to :user, dependent: :delete

  validates :name, presence: true
  validates :bio, length: { minimum: 10, maximum: 120 }

  has_attached_file :avatar, styles: { thumb: "100x100>", medium: "300x300>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
