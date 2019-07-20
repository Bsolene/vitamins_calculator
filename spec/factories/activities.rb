FactoryBot.define do
  factory :activity do
    association :user, factory: :user

    trait :food_intake do
      name { 'food_intake' }
    end

    trait :activity_level do
      name { 'activity_level' }
    end

    trait :recipe do
      name { 'recipe' }
    end
  end
end
