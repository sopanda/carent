FactoryBot.define do
  factory :car_model do
    car_make
    name { FFaker::Vehicle.model }
  end
end