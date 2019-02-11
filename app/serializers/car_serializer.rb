# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :model, :year, :status, :daily_price, :latitude, :longitude,
  :doors, :transmission, :child_seat, :fuel_type, :mileage, :color, :owner, :address

  belongs_to :owner
end
