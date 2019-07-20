FactoryBot.define do
  factory :activity do
    association :user, factory: :user

    trait :food_intake do
      name { 'food_intake' }
    end

    trait :activity do
      name { 'activity' }
    end

    trait :recipe do
      name { 'recipe' }
    end
  end
end
