# frozen_string_literal: true

module Cars
  class AvailabilityController < ApplicationController
    before_action :authenticate_user

    # kids, do not use custom actions in your controllers. Better do drugs

    def activate
      return render_text_error('params error') unless params.dig('description').present? && 
                                                      params.dig('start_date').present? &&
                                                      params.dig('end_date').present?
      if car.pending?
        car.update(description: params.dig('description'), 
                   start_date: params.dig('start_date'),
                   end_date: params.dig('end_date'))
        render_200(msg: car.enable!)
      else
        render_text_error('should be in pending state!')
      end
    end

    def deactivate
      if car.available?
        car.update(descriprion: nil, start_date: nil, end_date: nil)
        return render_error(car) if car.errors.present?
        render_200(msg: car.disable!)
      else
        render_text_error('should be in available state!')
      end
    end

    private

    def car
      @car ||= Car.find(params[:car_id])
    end
  end
end
