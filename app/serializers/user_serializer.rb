class UserSerializer < ActiveModel::Serializer
  has_many :events_created

  # has_many :events_attending

  attributes :id, :username, :email, :image_src, :bio

  def image_src
    object.image.url
  end
end
