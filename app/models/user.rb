class User < ApplicationRecord
  has_secure_password
  has_many :babies, dependent: :destroy

  validates :name, :last_name, :email, :password, presence: true, on: [:new, :create]
  validates :name, :last_name, length: { minimum: 2 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates_confirmation_of :password

  def full_name
    "#{name} #{last_name}"
  end

  def is_admin?
    level >= 2
  end
end
