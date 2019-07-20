class Nutrient < ApplicationRecord
  validates :name, uniqueness: true
end

