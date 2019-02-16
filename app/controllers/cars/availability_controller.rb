# frozen_string_literal: true

module Cars
  class AvailabilityController < ApplicationController
    before_action :authenticate_user

    # kids, do not use custom actions in your controllers. Better do drugs

    def activate
      start_date  = parse_date params.dig('start_date')
      end_date    = parse_date params.dig('end_date')
      description = params.dig('description')

      return render_text_error('descripton can\'t be blank') if description.nil?
      return render_text_error('invalid start date')         if start_date.nil?
      return render_text_error('invalid end date')           if end_date.nil?

      if car.pending?
        car.update(description: description, 
                   start_date: start_date,
                   end_date: end_date)
        car.enable!
        return render_error(car) if car.errors.present?
        render_200(msg: true)
      else
        render_text_error('should be in pending state!')
      end
    end

    def deactivate
      if car.available?
        car.update(description: nil, start_date: nil, end_date: nil)
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

    def parse_date(date)
      DateTime.strptime(date, "%d/%m/%Y %H:%M")
    rescue
      nil
    end
  end
end
