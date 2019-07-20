class Nutrient < ApplicationRecord
  has_many :activity_nutrients
  validates :name, uniqueness: true
end

