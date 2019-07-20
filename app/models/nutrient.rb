class Nutrient < ApplicationRecord
  NUTRIENT_TYPES = %w[vitamin_c vitamin_d3 iron].freeze

  has_many :activity_nutrients
  validates :name, uniqueness: true
end

