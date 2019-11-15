class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  has_many :items
  has_many :coordinates
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true, length: { minimum: 7 }
end
