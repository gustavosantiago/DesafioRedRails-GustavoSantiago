FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :username do |n|
    "username#{n}"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    username
    password '12345678'
    password_confirmation '12345678'
  end
end