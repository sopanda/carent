class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :car_make
  belongs_to :car_model

  validates :year, inclusion: 1960..2018

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
