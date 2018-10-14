FactoryBot.define do
  factory :user, aliases: [:owner, :renter, :author] do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    username   { FFaker::Internet.user_name }
    email      { "#{username}@example.com".downcase }
    password   { FFaker::Internet.password }
  end
end