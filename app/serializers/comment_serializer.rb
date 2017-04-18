class CommentSerializer < ActiveModel::Serializer
  belongs_to :event
  belongs_to :user
  attributes :id, :body, :user
end
