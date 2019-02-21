# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_user

  def index
    render_200(current_user.bookings)
  end

  def show
    render_200(current_user.bookings.find(params[:id]))
  end

  def finish
    if booking.active?
      booking.finish!
      booking.car.return!
      return render_error(booking) if booking.errors.present?
      render_200(msg: true)
    else
      render_text_error('should be in active state!')
    end
  end

  private

  def booking
    @booking ||= Booking.find(params[:booking_id])
  end
end
