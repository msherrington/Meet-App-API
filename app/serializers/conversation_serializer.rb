class ConversationSerializer < ActiveModel::Serializer
  belongs_to :sender
  belongs_to :receiver

  attributes :id, :sender_id, :receiver_id, :recipient, :unread_message_count

  def recipient
    object.recipient(current_user)
  end

  def unread_message_count
    object.unread_message_count(current_user)
  end
end
