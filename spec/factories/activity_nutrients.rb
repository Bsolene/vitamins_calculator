FactoryBot.define do
  factory :activity_nutrient do
    association :activity, factory: :activity
    association :nutrient, factory: :nutrient
    amount { 3 }
  end
end
