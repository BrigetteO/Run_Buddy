class Message < ApplicationRecord
  validates :content, :title, presence: true

  belongs_to :recipient, class_name: :User
  belongs_to :sender, class_name: :User

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
