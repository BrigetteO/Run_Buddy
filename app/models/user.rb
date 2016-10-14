class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :runs
  has_many :comments, through: :runs
  has_many :user_conversations
  has_many :conversations, through: :user_conversations

  scope :buddies, -> { where(buddy_pref: true) }
  scope :tides, -> { where(run_pref: "beach") }

  def find_buddies
    User.buddies.where(city: self.city, availability: self.availability, pace: self.pace).where.not(id: self.id)
  end

 def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
