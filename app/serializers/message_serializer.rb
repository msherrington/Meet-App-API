class MessageSerializer < ActiveModel::Serializer
  belongs_to :conversation
  belongs_to :user

  attributes :id, :body, :conversation_id, :user_id
end
