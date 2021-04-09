class Height < ApplicationRecord
  belongs_to :baby

  validates :baby_id, :height, :date, presence: true
  validate :not_zero

  def not_zero
    false
  end

  def self.percentils_from_upto_2y
    percentils_from_upto_2y = {
                    "Percentile 3" => { 0 => 46.93, 3 => 55.43, 6 => 62.84, 9 => 67.07, 12 => 70.02, 18 => 76.76, 24 => 81.86 },
                    "Percentile 50" => { 0 => 49.84, 3 => 61.08, 6 => 67.37, 9 => 72.09, 12 => 75.38, 18 => 82.35, 24 => 88.03},
                    "Percentile 97" => { 0 => 52.75, 3 => 66.73, 6 => 71.91, 9 => 77.1, 12 => 80.74, 18 => 87.94, 24 => 94.21}
                  }
  end



  # private

  # def age_at_time(time)
  #   (time - self.dob).to_i / 30
  # end
end