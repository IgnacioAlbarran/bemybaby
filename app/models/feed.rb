class Feed < ApplicationRecord
  belongs_to :baby
  attr_accessor :day

  WEEK_DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  scope :in_day, -> (day) { where("date > ?", Date.new(day).to_date) }
  scope :today, -> { where("date == ?", Date.today) }

  validates :date, :hour, :mililitres, presence: true
  validate :feed_uniqueness_validation, on: :create

  def feeds_in_the_day(day)
    where(baby_id: session[:baby_id]).where(date: day).order(:hour)
  end

  def self.total_ml_week(feeds_week)
    total = []
    feeds_week.each_value{ |v| total << v[:mililitres] }
    total = total.sum || 0
  end

  def self.week_average(feeds_week)
    number_of_days_registered = feeds_week.values.pluck(:mililitres).select{ |x| x > 0 }.count
    if number_of_days_registered > 0
      total_ml_week(feeds_week) / feeds_week.values.pluck(:mililitres).select{ |x| x > 0 }.count
    else
      0
    end

  end

  def feeds_by_week_chart
    data = []
    data = @feeds_week.values.each { |day| chart << day.values }
  end
  private

  def feed_uniqueness_validation
    if Feed.where(baby_id: baby_id, date: date, hour: hour, mililitres: mililitres).exists?
      errors.add(:hour, '¡Toma ya registrada!')
    end
  end
end
