FactoryBot.define do
  factory :user do
    name      { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email     { FFaker::Internet.email }
    password  { FFaker::Internet.password }
    level     { 1 }
  end
end
