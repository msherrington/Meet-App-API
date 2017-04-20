class UserSerializer < ActiveModel::Serializer
  has_many :events_created
  has_many :events

  # has_many :events_attending

  attributes :id, :username, :email, :image_src, :bio, :events

  def image_src
    object.image.url
  end
end
