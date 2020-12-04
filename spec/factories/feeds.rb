# Frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    date { Date.today }
    hour { Date.today.beginning_of_day + rand(0..24).hours }
    mililitres { [30, 60, 90, 150, 210].sample }
  end
end
