# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :reviews, class_name: 'Car::Review'
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :latitude, :longitude, :daily_price, :model, :year, presence: true
  validates :latitude, :longitude, :daily_price, numericality: true
  validates :year, inclusion: 1960..Time.current.year

  reverse_geocoded_by :latitude, :longitude
  after_save :set_geocoded_address

  def set_geocoded_address
    raw_address = Geocoder.search("#{latitude}, #{longitude}").first.data['address']
    update_column('address', raw_address)
  end
end
