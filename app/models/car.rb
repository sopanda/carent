# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :booking_requests, class_name: 'Car::BookingRequest', dependent: :destroy
  has_many :reviews,          class_name: 'Car::Review',         dependent: :destroy

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', dependent: :destroy

  validates :latitude, :longitude, :model, presence: true
  validates :latitude, :longitude, :daily_price, numericality: true
  validates :year, inclusion: 1960..Time.current.year
  validates :mileage, numericality: { greater_than_or_equal_to: 0 }
  validates :doors, inclusion: { in: [2, 4],
                                 message: 'should be one of [2 4]' }
  validates :transmission, inclusion: { in: %w[auto semi-auto manual],
                                        message: 'should be one of [auto semi-auto manual]' }
  validates :fuel_type, inclusion: { in: %w[gasoline diesel gas],
                                     message: 'should be one of [gasoline diesel gas]' }

  reverse_geocoded_by :latitude, :longitude
  after_save :set_geocoded_address

  def set_geocoded_address
    raw_address = Geocoder.search("#{latitude}, #{longitude}").first.data['address']
    update_column('address', raw_address) # rubocop:disable Rails/SkipsModelValidations
  end
end
