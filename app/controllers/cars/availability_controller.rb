# frozen_string_literal: true

module Cars
  class AvailabilityController < ApplicationController
    before_action :authenticate_user

    # kids, do not use custom actions in your controllers. Better do drugs

    def activate
      return render_200(msg: car.enable!) if car.pending?
      render_text_error('should be in pending state!')
    end

    def deactivate
      return render_200(msg: car.disable!) if car.available?
      render_text_error('should be in available state!')
    end

    private

    def car
      @car ||= Car.find(params[:car_id])
    end
  end
end
