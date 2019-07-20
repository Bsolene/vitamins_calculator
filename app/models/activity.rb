class Activity < ApplicationRecord
  ACTIVITY_TYPES = %w[food_intake activity recipe].freeze

  belongs_to :user
  has_many :activity_nutrients
  validates :name, inclusion: { in: ACTIVITY_TYPES }
end
