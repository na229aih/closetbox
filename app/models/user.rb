class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  has_many :items
  has_many :coordinates
  has_many :comments
  has_many :likes, dependent: :destroy
end
