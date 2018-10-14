FactoryBot.define do
  factory :car_make do
    name { FFaker::Vehicle.make }
  end
end