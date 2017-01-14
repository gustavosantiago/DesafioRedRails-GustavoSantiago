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

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "should haven't a nil email" do
    user = FactoryGirl.create(:user)
    
    expect(user.email).to_not eq(nil)
  end

  it "should have a valid email" do
    email = "example,test@test,com"
    username = "@test"
    password = 1..6
    user = build(:user, 
                  email: email, 
                  username: username, 
                  password: password, 
                  password_confirmation: password)
    user.valid?

    expect(user.errors[:email].size).to eq(1)
  end

  it "should have a profile" do
    user = User.new
    user.build_profile(name: "Lorem", bio: "Ypsum Lorem")

    expect(user.profile).to be_valid
  end

end
