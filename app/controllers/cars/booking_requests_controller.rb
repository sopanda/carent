# frozen_string_literal: true

module Cars
  class BookingRequestsController < ApplicationController
    before_action :authenticate_user

    def index
      render_200(car.booking_requests.where(sender: current_user))
    end

    def create
      created_request = car.booking_requests.create(sender: current_user)
      return render_error(created_request) if created_request.errors.present?
      render_200(created_request)
    end

    def destroy
      booking_request.destroy
      head :ok
    end

    private

    def car
      @car ||= Car.find(params[:car_id])
    end

    def booking_request
      @booking_request ||= car.booking_requests.where(sender: current_user).find(id: params[:id])
    end
  end
end
