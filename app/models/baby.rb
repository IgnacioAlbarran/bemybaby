class Baby < ApplicationRecord
  WEEK_DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  belongs_to :user
  has_many :users
  has_many :feeds, source: :user

  validates :name, :last_name, :dob, :gender, :blood_type, presence: true
  validates_with BabyValidator, on: :create

  scope :active, -> { where(deleted_at: nil) }

  enum blood_type: {
    'A+': 'A+',
    'A-': 'A-',
    'B+': 'B+',
    'B-': 'B-',
    'AB+': 'AB+',
    'AB-': 'AB-',
    '0+': '0+',
    '0-': '0-'
  }

  def baby_exists?
    !Baby.where(name: name, last_name: last_name, blood_type: blood_type, dob: dob).blank?
  end

  def total_feeds_in_the_day(day)
    feeds.where(date: day).pluck(:mililitres).sum
  end

  def feed_list_day(day)
    feeds.where(date: day).sort_by(&:hour)
  end

  def feeds_week_by_day(reference_day)
    selected_week_monday = reference_day.to_date.monday
    data = Hash.new
    WEEK_DAYS.each do |day|
      corresponding_date = selected_week_monday + WEEK_DAYS.index(day)
      data[day] = {
                    date: corresponding_date,
                    mililitres: feeds.where(date: corresponding_date).pluck(:mililitres).sum
                  }
    end
    return data
  end
end
