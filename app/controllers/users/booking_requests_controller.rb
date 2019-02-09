# frozen_string_literal: true

module Users
  class BookingRequestsController < ApplicationController
    before_action :authenticate_user

    def index
      render_200(requests)
    end

    def show
      render_200(requests.find(params[:id]))
    end

    private

    def requests
      @requests ||= Car::BookingRequest.where(car: current_user.cars)
    end
  end
end
