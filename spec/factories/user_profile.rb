FactoryGirl.define do
  sequence :name do |n|
    "person#{n}"
  end

  sequence :bio do |n|
    "Lorem Ypsum Fortal city"
  end
end

FactoryGirl.define do
  factory :profile, class: 'UserProfile' do
    name
    bio
  end
end