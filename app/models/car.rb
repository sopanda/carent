# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :year, inclusion: 1960..2018

  #reverse_geocoded_by :latitude, :longitude
  after_validation :set_geocoded_address

  scope :price, ->(type) { order("daily_price #{type}") }

  def set_geocoded_address
    raw_address = Geocoder.search("#{latitude}, #{longitude}").first.data['address']
    update_attribute('address', raw_address)
  end
end
