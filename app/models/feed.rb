class Feed < ApplicationRecord
  belongs_to :baby

  #scope :total_hoy, -> { where(:date > Date.today).where(:date < Date.tomorrow) }

  validates :date, :hour, :mililitres, presence: true

  def daily_feeds(baby_id)
    Feed.where(baby_id: baby_id).where("date > ?",Date.yesterday).pluck(:mililitres).sum
  end
end
