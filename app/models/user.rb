class User < ApplicationRecord
  has_many :activities
  validates :username, uniqueness: true
end
