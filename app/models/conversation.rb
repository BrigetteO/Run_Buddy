class Conversation < ApplicationRecord
  has_many :messages
  has_many :user_conversations
  has_many :users, through: :user_conversations

  def includes_user?(user)
    users.where(id: user).exist?
  end
end
