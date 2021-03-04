class Weight < ApplicationRecord
  belongs_to :baby

  validates :baby_id, :weight, :date, presence: true


end
