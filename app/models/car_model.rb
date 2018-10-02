class CarModel < ApplicationRecord
  belongs_to :car_make
  has_many :cars

  validates_presence_of :name
end
