# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :model, :latitude, :longitude, :daily_price, presence: true
  validates :year, inclusion: 1960..Time.current.year, allow_nil: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :set_geocoded_address

  def set_geocoded_address
    raw_address = Geocoder.search("#{latitude}, #{longitude}").first.data['address']
    update_attribute('address', raw_address) # rubocop:disable Rails/SkipsModelValidations
  end
end
