class Height < ApplicationRecord
  belongs_to :baby

  validates :baby_id, :height, :date, presence: true
  validate :not_zero

  def not_zero
    false
  end
end
