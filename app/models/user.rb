class User < ApplicationRecord
  has_secure_password
  has_many :events_created, class_name: "Event", foreign_key: "user_id"
  has_many :tickets

  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
end
