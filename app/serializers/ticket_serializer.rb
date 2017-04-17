class TicketSerializer < ActiveModel::Serializer
  attributes :id, :user
  belongs_to :event
  belongs_to :user
end
