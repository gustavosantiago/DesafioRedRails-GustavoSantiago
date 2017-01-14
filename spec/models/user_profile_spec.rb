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

require 'rails_helper'

RSpec.describe UserProfile, type: :model do
end
