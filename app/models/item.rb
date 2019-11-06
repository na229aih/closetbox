class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :coordinate_items
  has_many :coordinates, through: :coordinate_items
end
