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
    !Baby.where(name: name, last_name: last_name, dob: dob).blank?
  end
end
