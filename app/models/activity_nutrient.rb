class ActivityNutrient < ApplicationRecord
  belongs_to :activity
  belongs_to :nutrient

  validates :activity, presence: true
  validates :nutrient, presence: true
end
