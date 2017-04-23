class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :nullify
  has_many :comments, dependent: :destroy
  has_many :categories
  has_many :users, through: :tickets
  mount_uploader :image, ImageUploader
end
