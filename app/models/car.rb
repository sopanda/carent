# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :year, inclusion: 1960..2018

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  scope :price, ->(type) { order("daily_price #{type}") }
end
