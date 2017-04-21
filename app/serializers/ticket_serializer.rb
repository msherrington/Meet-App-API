class TicketSerializer < ActiveModel::Serializer
  attributes :id, :user, :event
  belongs_to :event
  belongs_to :user
end
