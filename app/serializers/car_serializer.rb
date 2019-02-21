# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :model, :description, :start_date, :end_date, :year, :status, :daily_price, :doors, :air_conditioner,
  :latitude, :longitude, :transmission, :child_seat, :fuel_type, :mileage, :color, :owner, :address, :photo, :renter, :booking

  belongs_to :owner
  belongs_to :renter

  def start_date
    object[:start_date]&.strftime('%I:%M %m/%d/%Y')
  end

  def end_date
    object[:end_date]&.strftime('%I:%M %m/%d/%Y')
  end

  def status
    object[:aasm_state]
  end

  def photo
    object.photo.service_url.split('?').first if object.photo.attached?
  end

  def renter
    Booking.where(car: object)&.last&.renter
  end
  
  def booking
    Booking.where(car: object)&.last
  end
end
