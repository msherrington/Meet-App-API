class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets
  has_and_belongs_to_many :attendees, class_name: "User", foreign_key: "user_id"
end
