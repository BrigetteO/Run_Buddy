class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :sender,  class_name: :User, foreign_key: :user_id
  belongs_to :recipient, class_name: :User, foreign_key: :recipient_id
end
