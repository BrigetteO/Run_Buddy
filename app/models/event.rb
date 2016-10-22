class Event < ApplicationRecord
  validates :start_time, :location, :name, presence: true

  def convert_time
    self.time.strftime('%H:%M %p')
  end

  def convert_date
    self.date.strftime('%a, %b %d')
  end
end