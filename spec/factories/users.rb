FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "#{Faker::Internet.username}-#{n}" }
  end
end
