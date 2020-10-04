# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'factory_bot_rails'

10.times do
  FactoryBot.create(:user)
end

User.all.each do |user|
  FactoryBot.create(:baby, user_id: user.id)
end
