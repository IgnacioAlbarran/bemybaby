FactoryBot.define do
  factory :baby do
    name        { FFaker::Name.first_name }
    last_name   { FFaker::Name.last_name }
    dob         { Date.new(2018) }
    gender      { 'niño' }
    blood_type  { 'A-' }
    deleted_at  { nil }
  end
end
