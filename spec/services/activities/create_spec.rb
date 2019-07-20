require 'rails_helper'

RSpec.describe Activities::Create do
  let(:user) { create(:user) }

  subject { described_class.call(user: user, name: name) }

  describe '#call' do
    context 'when name is not correct' do
      let(:name) { 'invalid_name' }

      it 'raises an error' do
        expect { subject }.to raise_error(/invalid name/)
      end
    end

    context 'when name is correct' do
      let(:name) { 'food_intake' }

      it 'create an activity' do
        subject

        expect(user.activities.size).to eq(1)
        expect(user.activities.first.name).to eq('food_intake')
      end
    end
  end
end
