class Baby < ApplicationRecord
  WEEK_DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  belongs_to :user
  has_many :users
  has_many :feeds, source: :user
  has_many :weights
  has_many :heights

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
    Baby.exists?(name: name, last_name: last_name, blood_type: blood_type, dob: dob)
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
                    date: I18n.l(corresponding_date, format: '%A'),
                    mililitres: feeds.where(date: corresponding_date).pluck(:mililitres).sum
                  }
    end
    return data
  end

  def min_feed
    minimum_feeds =  {
      3 => 20,
      7 => 60,
      15 => 80,
      30 => 110,
      60 => 120,
      90 => 150,
      120 => 180,
      150 => 210,
      180 => 240,
      1095 => 300
    }

    age_baby_days = (Date.today - self.dob).to_i
    minimum_feeds[minimum_feeds.keys.select { |key| key > age_baby_days }.first]
  end

  def height_data
    height_data = Hash.new
    heights.each do |height|
      age_at_date = (height.date.to_date - dob).to_i / 30.5
      height_data[age_at_date] = height.height
    end
    height_data
  end

  def weight_data
    weight_data = Hash.new
    weights.each do |weight|
      age_at_date = (weight.date.to_date - dob).to_i / 30.5
      weight_data[age_at_date] = weight.weight
    end
    weight_data
  end

  def age_in_months
    (Date.today - self.dob).to_i / 30.5
  end

  def height_percentils
    if gender == 'niña'
      Height.girl_percentils
    else
      Height.boy_percentils
    end
  end

  def weight_percentils
    if gender == 'niña'
      Weight.girl_percentils
    else
      Weight.boy_percentils
    end
  end

  def next_vaccines
    Vaccine.next_vaccines(self)
  end
end
