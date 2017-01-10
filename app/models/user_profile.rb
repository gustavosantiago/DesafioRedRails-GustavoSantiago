class UserProfile < ApplicationRecord
  belongs_to :user, dependent: :delete

  validates :name, presence: true
  validates :bio, length: { minimum: 10, maximum: 120 }

  has_attached_file :avatar, 
  					storage: :cloudinary,
  					cloudinary_credentials: Rails.root.join("config/cloudinary.yml"),
  					styles: { medium: "300x300>", thumb: "100x100>" }, 
  					default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
