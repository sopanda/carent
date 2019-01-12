# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    renter
    car
    start_date { DateTime.now.to_date + rand(5..15).days }
    end_date   { DateTime.now.to_date + rand(16..30).days }
    status     { FFaker::Lorem.word }
  end
end
