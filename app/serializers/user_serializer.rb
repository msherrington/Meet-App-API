class UserSerializer < ActiveModel::Serializer
  has_many :events_created
  has_many :events

  attributes :id, :username, :email, :image_src, :bio, :events

  def image_src
    object.image.url
  end
end
