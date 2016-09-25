class Kudo < ApplicationRecord
  validates :user_id, :run_id, presence: true

  belongs_to :user
  belongs_to :run
end
