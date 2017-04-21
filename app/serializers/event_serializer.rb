class EventSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :comments
  has_many :tickets
  has_many :categories
  has_many :users
  attributes :id, :name, :location, :date, :description, :max_tickets, :tickets_left, :price, :image_src, :video, :users, :latitude, :longitude, :tickets

  def image_src
    object.image.url
  end
end
