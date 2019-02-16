# frozen_string_literal: true

module Cars
  class PhotosController < ApplicationController
    before_action :authenticate_user

    def update
      return render_text_error('photo params empty!') if params[:photo].nil?
      car.photo.attach(params[:photo])
      car.save # for validation
      return render_error(car) if car.errors.present?
      render_200(car)
    end

    private

    def car
      @car ||= Car.find(params[:car_id])
    end
  end
end
