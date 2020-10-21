class Feed < ApplicationRecord
  belongs_to :baby

  #scope :total_hoy, -> { where(:date > Date.today).where(:date < Date.tomorrow) }

  validates :date, :hour, :mililitres, presence: true
  validate :feed_uniqueness_validation, on: :create

  private

  def feed_uniqueness_validation
    if Feed.where(baby_id: baby_id, date: date, hour: hour, mililitres: mililitres).exists?
      errors.add(:hour, '¡Toma ya registrada!')
    end
  end
end
