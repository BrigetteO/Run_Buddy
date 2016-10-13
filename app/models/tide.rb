class Tide < ApplicationRecord
  validates :date, :time, :day, :predictions_in_ft, :predictions_in_cm, :highlow, presence: true

  scope :current_week, -> { where(date: Time.now.to_date..(Time.now.to_date + 7.days)) }
  scope :current, -> { where('date = :today', { today: Time.now.to_date } ) }


  def convert_time
    self.time.strftime('%H:%M %p')
  end

  def convert_date
    self.date.strftime('%a, %b %d')
  end

  def self.calculate_avg
    all.average(:predictions_in_ft).to_i
  end

end
