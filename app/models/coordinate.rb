class Coordinate < ApplicationRecord
  belongs_to :user
  has_many :coordinate_items, dependent: :destroy
  has_many :items, through: :coordinate_items
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
