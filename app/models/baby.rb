class Baby < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :feeds, source: :user

  validates :name, :last_name, :dob, :gender, :blood_type, presence: true
  validates_with BabyValidator, on: :create

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

  def feeds_in_the_day
    Feed.where(baby_id: id).where("date > ?", Date.yesterday).pluck(:mililitres).sum
  end
end
