class User < ApplicationRecord
   has_secure_password
   has_many :babies, dependent: :destroy

   validates :email, :password, presence: true
   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
   # validates_presence_of :password_confirmation, :if => :password_changed?
   validates_confirmation_of :password

   def full_name
      "#{self.name} #{self.last_name}"
   end
end
