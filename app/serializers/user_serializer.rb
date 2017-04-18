class UserSerializer < ActiveModel::Serializer
  has_many :events_created

  attributes :id, :username, :email, :image, :bio
end
