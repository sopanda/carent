# frozen_string_literal: true

class Booking < ApplicationRecord
  enum status: %i[started_soon ongoing ended]

  belongs_to :renter, inverse_of: :bookings, class_name: 'User'
  belongs_to :car
  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validates_with ::Bookings::DateValidator

  def total_rent_price
    daily_price * total_days
  end

  def total_days
    (end_date - start_date).to_i
  end
end
