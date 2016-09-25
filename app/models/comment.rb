class Comment < ApplicationRecord
  validates :content, :user_id, :run_id, presence: true

  belongs_to :user
  belongs_to :run
end
