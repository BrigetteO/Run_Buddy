class Event < ApplicationRecord
  validates :start_time, :location, :name, presence: true

  has_many :users, through: :users_events
  has_many :users_events

  scope :current_week, -> { where(start_time: DateTime.now.to_datetime..(DateTime.now.to_datetime + 7.days)) }
  scope :current_month, -> { where("start_time.strftime('%M') = :month", { month: DateTime.now.month } ) }

  def convert_start_time_to_time
    self.start_time.strftime('%H:%M %p')
  end

  def convert_start_time_to_date
    self.start_time.strftime('%a, %b %d')
  end

  def current_month?
    self.start_time.strftime('%M') == DateTime.now.month
  end 
end