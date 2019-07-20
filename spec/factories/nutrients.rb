FactoryBot.define do
  factory :nutrient do
    trait :vitamin_c do
      name { 'vitamin_c' }
    end

    trait :vitamin_d3 do
      name { 'vitamin_d3' }
    end

    trait :iron do
      name { 'iron' }
    end
  end
end
