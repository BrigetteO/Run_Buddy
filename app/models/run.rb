class Run < ApplicationRecord
  validates :title, :user_id, :date, :time, :location, :miles, presence: true

  belongs_to :user
  has_many :kudos
  has_many :comments

  def kudos_given?(user_id)
    self.kudos.map(&:user_id).include?(user_id)
  end

  def kudos_count
    self.kudos.count
  end

  def convert_time
    self.time.strftime('%H:%M %p')
  end

  def convert_date_abbr
    self.date.strftime('%a, %b')
  end

  def convert_date
    self.date.strftime('%a, %b %d')
  end
end
