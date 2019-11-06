class Coordinate < ApplicationRecord
  belongs_to :user
  has_many :coordinate_items
  has_many :items, through: :coordinate_items
end
