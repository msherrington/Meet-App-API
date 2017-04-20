class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets
  has_many :comments
  has_many :categories
  # has_and_belongs_to_many :attendees, class_name: "User", foreign_key: "user_id"
  has_many :users, through: :tickets
  mount_uploader :image, ImageUploader
end
