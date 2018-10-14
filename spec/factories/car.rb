FactoryBot.define do
  factory :car do
    owner
    car_make
    car_model
    year        { FFaker::Vehicle.year }
    latitude    { FFaker::Geolocation.lat }
    longitude   { FFaker::Geolocation.lng }
    daily_price { rand(100..1000) }
    status      { FFaker::Lorem.word }
  end
end