class Conversation < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :conversation

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end