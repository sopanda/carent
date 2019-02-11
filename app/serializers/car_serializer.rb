# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :model, :description, :start_date, :end_date, :year, :status, :daily_price, :doors,
  :latitude, :longitude, :transmission, :child_seat, :fuel_type, :mileage, :color, :owner, :address, :photo

  belongs_to :owner

  def start_date
    object[:start_date]&.strftime('%I:%M %m/%d/%Y')
  end

  def end_date
    object[:end_date]&.strftime('%I:%M %m/%d/%Y')
  end
end
