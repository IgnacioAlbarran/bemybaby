class User < ApplicationRecord
   has_secure_password
   has_many :babies, dependent: :destroy

   validates :name, :last_name, :email, :password, presence: true
   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
   # validates_presence_of :password_confirmation, :if => :password_changed?
   validates_confirmation_of :password

   def full_name
      "#{self.name} #{self.last_name}"
   end
end
