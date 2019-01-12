# frozen_string_literal: true

class CarsController < ApplicationController
  # before_action :authenticate_user, except: %i[index show]
  before_action :set_car, only: %i[show update destroy]

  def index
    fetch_service.call
    return render_error(fetch_service) unless fetch_service.valid?
    render_200(fetch_service.data)
  end

  def show
    render json: @car
  end

  def create
    car = Car.new(car_params)
    if car.save
      render json: { msg: "Car ##{car.id} was created" }, status: :created
    else
      render_error(car)
    end
  end

  def update
    if @car.update(car_params)
      render json: { msg: "Car ##{@car.id} has been updated" }
    else
      render_error(@car)
    end
  end

  def destroy
    if @car.destroy
      render json: { msg: "Car ##{@car.id} has been deleted" }
    else
      render_error(@car)
    end
  end

  private

  def fetch_service
    @fetch_service ||= ::Api::Cars::NearestCarsService.new(latitude: params[:latitude],
                                                           longitude: params[:longitude],
                                                           range: params[:range])
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
