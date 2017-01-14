# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  before_save :downcase_email
  before_save :apply_at
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, class_name: "UserProfile"
  has_many :tweets
  has_many :user_followers, class_name: "Relationship",
                            foreign_key: "follower_id", 
                            dependent: :destroy
  has_many :user_followeds, class_name: "Relationship",
                            foreign_key: "followed_id",
                            dependent: :destroy
  

  has_many :following, through: :user_followers, source: :followed
  has_many :followers, through: :user_followeds, source: :follower

  accepts_nested_attributes_for :profile
  attr_accessor :name, :bio, :avatar

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates :email, presence: true, uniqueness: true
  validates :username, length: { minimum: 6 }, on: :update
  validates :email, format: { with: EMAIL_REGEX }, on: [:create, :update] 

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

    def downcase_email
      self.email = email.downcase.to_s
    end

    def apply_at
      # unless self.username.
      #   self.username = "@" + username.downcase.to_s
    end
end
