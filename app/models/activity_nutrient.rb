class ActivityNutrient < ApplicationRecord
  belongs_to :activity_nutrient
  belongs_to :nutrient

  validates :activity_nutrient, presence: true
  validates :nutrient, presence: true
end
