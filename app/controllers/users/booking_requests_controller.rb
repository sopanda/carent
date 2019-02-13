# frozen_string_literal: true

module Users
  class BookingRequestsController < ApplicationController
    before_action :authenticate_user

    def index
      render_200(booking_requests)
    end

    def show
      render_200(booking_requests.find(params[:id]))
    end

    def approve
      return render_text_error('сar is no longer available') unless car.available?
      # delete booking request and create booking, in future set status to approved
      created_booking = Booking.create(booking_params)
      return render_error(created_booking) if created_booking.errors.present?
      car.use!
      booking_request.delete
      render_200(created_booking)
    end

    def decline
      # just delete booking request, in future set status to declined
      booking_request.delete
    end

    private

    def booking_params
      {
        start_date: booking_request.car.start_date,
        end_date: booking_request.car.end_date,
        renter: current_user,
        car: booking_request.car
      }
    end

    def car
      @car ||= booking_request.car
    end

    def booking_request
      @booking_request ||= Car::BookingRequest.find(params[:booking_request_id])
    end

    def booking_requests
      @booking_requests ||= Car::BookingRequest.where(car: current_user.cars)
    end
  end
end
