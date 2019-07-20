require 'rails_helper'

RSpec.describe Activities::GenerateRecipe do
  let(:today) { DateTime.now }
  let(:user) { create(:user) }

  let(:vitamin_c) { create(:nutrient, :vitamin_c) }
  let(:vitamin_d3) { create(:nutrient, :vitamin_d3) }
  let(:iron) { create(:nutrient, :iron) }

  let(:food_intake) { create(:activity, :food_intake, user: user, created_at: today) }
  let(:activity_level) { create(:activity, :activity_level, user: user, created_at: today) }

  subject { described_class.call(user, today) }

  describe '#call' do
    context 'when no food intake for the day' do
      it 'raises an error' do
        expect { subject }.to raise_error(/no food intake for this date/)
      end
    end

    context 'when no activity level for the day' do
      before { food_intake }
      it 'raises an error' do
        expect { subject }.to raise_error(/no activity level for this date/)
      end
    end

    context 'when food intake & activity level for the day' do
      before do
        create(
          :activity_nutrient,
          nutrient: vitamin_c,
          amount: 4,
          activity: food_intake
        )
        create(
          :activity_nutrient,
          nutrient: vitamin_d3,
          amount: 5,
          activity: food_intake
        )
        create(
          :activity_nutrient,
          nutrient: iron,
          amount: 6,
          activity: food_intake
        )
        create(
          :activity_nutrient,
          nutrient: vitamin_c,
          amount: -3,
          activity: activity_level
        )
        create(
          :activity_nutrient,
          nutrient: vitamin_d3,
          amount: -2,
          activity: activity_level
        )
        create(
          :activity_nutrient,
          nutrient: iron,
          amount: -1,
          activity: activity_level
        )
        subject
      end

      it 'create a new recipe activity' do
        expect(user.activities.size).to eq(3)
      end

      it 'create activity nutrient with right amount of nutrients' do
        recipe = user.activities.where(name: 'recipe').first
        recipe_nutrients = recipe.activity_nutrients
        expect(recipe.activity_nutrients.size).to eq(3)

        activity_nutrient_vitamin_c =
          recipe_nutrients.select { |an| an.nutrient.name == 'vitamin_c' }.first
        expect(activity_nutrient_vitamin_c.amount).to eq(9)

        activity_nutrient_vitamin_d3 =
          recipe_nutrients.select { |an| an.nutrient.name == 'vitamin_d3' }.first
        expect(activity_nutrient_vitamin_d3.amount).to eq(7)

        activity_nutrient_iron =
          recipe_nutrients.select { |an| an.nutrient.name == 'iron' }.first
        expect(activity_nutrient_iron.amount).to eq(5)
      end

      it 'returns a recipe activity' do
        expect(subject.name).to eq('recipe')
      end
    end
  end
end
