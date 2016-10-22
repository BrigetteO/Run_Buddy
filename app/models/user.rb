class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :runs
  has_many :comments, through: :runs
  has_many :received_messages, class_name: :Message, foreign_key: :recipient_id
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id
  has_many :events, through: :users_events 
  has_many :users_events

  scope :buddies, -> { where(buddy_pref: true) }
  scope :tides, -> { where(run_pref: "beach") }

  def find_buddies
    User.buddies.where(city: self.city, availability: self.availability, pace: self.pace).where.not(id: self.id)
  end

end
