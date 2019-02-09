# frozen_string_literal: true

class BookingSerializer < ActiveModel::Serializer
  attributes :id, :price, :start_date, :end_date, :status, :car, :renter

  belongs_to :renter
  belongs_to :car
end
