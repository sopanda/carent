class CarMake < ApplicationRecord
  has_one :car_model
  has_many :cars

  validates_presence_of :name
end
