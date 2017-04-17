class EventSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :tickets
  has_many :attendee_ids, class_name: "User", foreign_key: "user_id"
  attributes :id, :name, :location, :date, :description, :max_tickets, :tickets_left, :price, :image, :video, :attendee_ids
end
