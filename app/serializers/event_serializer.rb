class EventSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :tickets
  attributes :id, :name, :location, :date, :description, :max_tickets, :tickets_left, :price, :image, :video, :attendee_ids
end
