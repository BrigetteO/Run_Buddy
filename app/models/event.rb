class Event < ApplicationRecord
  validates :date, :time, :name, presence: true

  def start_time
    self.created_at
  end

  def convert_time
    self.time.strftime('%H:%M %p')
  end

  def convert_date
    self.date.strftime('%a, %b %d')
  end
end