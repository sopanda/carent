# frozen_string_literal: true

class CarsController < ApplicationController
  # before_action :authenticate_user, except: %i[index show]
  before_action :set_car, only: %i[show update destroy]

  attr_reader :car

  def index
    index_service.call
    return render_error(index_service) if index_service.errors.present?
    render_200(index_service.data)
  end

  def show
    render_200(car)
  end

  def create
    created_car = Car.create(car_params.merge(owner: current_user))
    return render_error(created_car) if created_car.errors.present?
    render_200(created_car)
  end

  def update
    car.update(car_params)
    return render_error(car) if car.errors.present?
    render_200(car)
  end

  def destroy
    car.destroy
    render_200(msg: 'Successfully deleted')
  end

  private

  def index_service
    @index_service ||= ::Api::Cars::Index.new(latitude: params[:latitude],
                                              longitude: params[:longitude],
                                              range: params[:range],
                                              filters: filter_params)
  end

  def car_params
    params.permit(:model, :year, :latitude, :longitude, :daily_price)
  end

  def filter_params
    params.permit(:price)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
