class Booking < ApplicationRecord
  enum status: [:started_soon, :ongoing, :ended]
  
  belongs_to :renter, class_name: 'User', foreign_key: 'renter_id'
  belongs_to :car

  validates_presence_of :daily_price, :start_date, :end_date
  validates_with ::BookingValidator


  def total_rent_price
    daily_price * total_days
  end

  def total_days
    (end_date - start_date).to_i
  end
end
