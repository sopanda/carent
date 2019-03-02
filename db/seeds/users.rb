User.create(first_name: 'Bohdan',
            last_name: 'Hushcha',
            username: 'sopanda',
            email: 'hushchabogdan@gmail.com',
            phone_number: '+123',
            password: '123123')

3.times do
    User.create(first_name: FFaker::NamePL.first_name,
                last_name:  FFaker::NamePL.last_name,
                username:   FFaker::Internet.user_name,
                email:      FFaker::Internet.email,
                phone_number: '+123',
                password: '123123')
end