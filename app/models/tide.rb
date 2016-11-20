class Tide < ApplicationRecord
  validates :date, :time, :day, :predictions_in_ft, :predictions_in_cm, :highlow, presence: true

  scope :current_week, -> { where(date: Time.now.to_date..(Time.now.to_date + 7.days)) }
  scope :current_day, -> { where('date = :today', { today: Time.now.to_date } ) }
  scope :high, -> { where('highlow = "H"')}
  scope :low, -> { where('highlow = "L"')}
  scope :date, -> { where date: date }


  def convert_time
    self.time.strftime('%H:%M %p')
  end

  def convert_date
    self.date.strftime('%b %d')
  end

  def convert_day
    self.date.strftime('%a')
  end

  def high?
    self.highlow == "H"
  end 

  def low?
    self.highlow == "L"
  end

  def grouped_by_date
    all.group_by(&:date) 
  end 

  def self.calculate_avg
    all.average(:predictions_in_ft).to_i
  end

end
