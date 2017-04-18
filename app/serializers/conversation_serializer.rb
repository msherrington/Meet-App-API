class ConversationSerializer < ActiveModel::Serializer
  belongs_to :sender
  belongs_to :receiver

  attributes :id, :sender_id, :receiver_id
end
