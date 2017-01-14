class UserProfile < ApplicationRecord
  belongs_to :user, dependent: :delete

  validates :name, presence: true
  validates :bio, length: { minimum: 10, maximum: 120 }

  has_attached_file :avatar, styles: { thumb: "100x100>", medium: "300x300>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
