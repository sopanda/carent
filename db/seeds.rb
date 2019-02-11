20.times do 
  Car.create!(model: "#{FFaker::Vehicle.make} #{FFaker::Vehicle.model}",
             year: rand(1990..2019),
             latitude: rand(50.001817..50.051817),
             longitude: rand(22.00042..22.03042),
             daily_price: rand(30..150),
             doors: [2, 4].sample,
             transmission: %w[auto semi-auto manual].sample,
             child_seat: [true, false].sample,
             fuel_type: %w[gasoline diesel gas].sample,
             mileage: rand(10000..100000),
             color: FFaker::Vehicle.base_color,
             photo: FFaker::Image.url,
             owner: User.find(rand(1..4)))
end