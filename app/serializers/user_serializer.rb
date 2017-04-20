class UserSerializer < ActiveModel::Serializer
  has_many :events_created
  has_many :events

  # has_many :events_attending

  attributes :id, :username, :email, :image, :bio, :events
end
