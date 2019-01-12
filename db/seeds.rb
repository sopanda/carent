# frozen_string_literal: true

yura = User.create!(first_name: 'Yurii',
                    last_name: 'Rogulya',
                    username: 'relaxcore',
                    email: 'yuriirogulya@gmail.com',
                    password: 'qweqwe')
bogdan = User.create!(first_name: 'Bogdan',
                      last_name: 'Hushcha',
                      username: 'sopanda',
                      email: 'hushchabogdan@gmail.com',
                      password: 'qweqwe')
jake = User.create!(first_name: 'Jake',
                    last_name: 'Helloworld',
                    username: 'qweqwe',
                    email: 'test@gmail.com',
                    password: 'qweqwe')
noname = User.create!(first_name: 'Pusya',
                      last_name: 'Kukusya',
                      username: 'pusichka98',
                      email: 'qweqwe@gmail.com',
                      password: 'qweqwe')

car1 = Car.create!(owner: yura,
                   model: 'Testa Roadster',
                   year: 2018,
                   latitude: 50.404101,
                   longitude: 24.239488,
                   status: 'somestatus',
                   daily_price: 1000)

car2 = Car.create!(owner: bogdan,
                   model: 'Tesla Model S',
                   year: 2015,
                   latitude: 50.007562,
                   longitude: 22.018838,
                   status: 'somestatus',
                   daily_price: 800)

car3 = Car.create!(owner: yura,
                   model: 'Audi A8',
                   year: 2010,
                   latitude: 49.816606,
                   longitude: 24.011255,
                   status: 'somestatus',
                   daily_price: 500)

booking1 = Booking.create!(renter: noname,
                           car: car1,
                           start_date: '2019/10/10',
                           end_date: '2019/10/22')
booking2 = Booking.create!(renter: jake,
                           car: car2,
                           start_date: '2019/10/25',
                           end_date: '2019/10/28')
booking3 = Booking.create!(renter: bogdan,
                           car: car3,
                           start_date: '2019/10/25',
                           end_date: '2019/11/15')

Review.create!(author: noname,
               booking: booking1,
               text: 'Test text 1',
               rating: 5)
Review.create!(author: jake,
               booking: booking2,
               text: 'Test text 2',
               rating: 2)
Review.create!(author: bogdan,
               booking: booking3,
               text: 'Test text 3',
               rating: 4)
