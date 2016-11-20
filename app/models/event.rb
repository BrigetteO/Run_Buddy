class Event < ApplicationRecord
  validates :start_time, :location, :name, presence: true

  has_many :users, through: :users_events
  has_many :users_events

  def convert_start_time_to_time
    self.start_time.strftime('%H:%M %p')
  end

  def convert_start_time_to_date
    self.start_time.strftime('%a, %b %d')
  end

  def current_month?
    self.start_time.month == DateTime.now.month
  end

  def current_year?
    self.start_time.year == DateTime.now.year
  end

  def month
    self.start_time.month
  end

  def year
    self.start_time.year
  end

end