FactoryBot.define do
  factory :checkup do
    baby { nil }
    date { "2021-04-23" }
    notes { "MyText" }
  end
end
