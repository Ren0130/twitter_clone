class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :favorites
  has_many :comments
  mount_uploader :image, ImageUploader

  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end
