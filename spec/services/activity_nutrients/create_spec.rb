require 'rails_helper'

RSpec.describe ActivityNutrients::Create do
  let(:user) { create(:user) }
  let(:vitamin_C) { create(:nutrient, :vitamin_C) }
  let(:recipe) { create(:activity, :recipe, user: user) }


  subject do
    described_class.call(
      nutrient: vitamin_C,
      activity: recipe,
      amount: amount
    )
  end

  describe '#call' do
    context 'when amount is not correct' do
      let(:amount) { -5 }

      it 'raises an error' do
        expect { subject }.to raise_error(/amount is not correct/)
      end
    end

    context 'when amount is correct' do
      let(:amount) { 5 }

      it 'create an activity_nutrient' do
        subject

        expect(recipe.activity_nutrients.size).to eq(1)
        expect(recipe.activity_nutrients.first.amount).to eq(5)
      end
    end
  end
end
