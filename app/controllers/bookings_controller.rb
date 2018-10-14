class BookingsController < ApplicationController
  #before_action :authenticate_user, except: %i[index show]
  before_action :set_booking, only: %i[show update destroy]

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    render json: @booking
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: { msg: "Booking ##{booking.id} was created" }, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: { msg: "Booking ##{@booking.id} has been updated" }
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @booking.destroy
      render json: { msg: "Booking ##{@booking} has been deleted" }
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:renter_id, :price, :start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
