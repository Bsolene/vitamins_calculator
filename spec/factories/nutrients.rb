FactoryBot.define do
  factory :nutrient do
    trait :vitamin_C do
      name { 'vitamin_C' }
    end

    trait :vitamin_D3 do
      name { 'vitamin_D3' }
    end

    trait :iron do
      name { 'iron' }
    end
  end
end
