# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :authenticate_user

  def index
    index_service.call
    return render_error(index_service) if index_service.errors.present?
    render_200(index_service.data)
  end

  def user_cars
    render_200(current_user.cars)
  end

  def my_loans
    my_cars = current_user.cars
    bookings = Booking.where(car: my_cars).active
    render_200(Car.where(bookings: bookings))
  end

  def my_orders
    bookings = current_user.bookings.active
    render_200(Car.where(bookings: bookings))
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
    head :ok
  end

  private

  def index_service
    @index_service ||= ::Api::Cars::Index.new(latitude: params[:latitude],
                                              longitude: params[:longitude],
                                              range: params[:range],
                                              filters: filter_params)
  end

  def car_params
    params.permit(:model, :year, :latitude, :longitude, :daily_price, :photo, :air_conditioner,
                  :doors, :transmission, :fuel_type, :mileage, :child_seat, :color)
  end

  def filter_params
    params.permit(:price)
  end

  def car
    @car ||= Car.find(params[:id])
  end
end
