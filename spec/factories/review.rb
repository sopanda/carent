FactoryBot.define do
  factory :review do
    author
    booking
    text    { FFaker::Lorem.sentence }
    rating  { rand(1..5) }
  end
end