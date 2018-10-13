class CarsController < ApplicationController
  before_action :authenticate_user, except: %i[index show]
  before_action :set_car, only: %i[show update destroy]

  def index
    set_car_params
    @cars = NearestCarsService.new(@latitude, @longitude, @range).perform
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    car = Car.new(car_params)
    if car.save
      render json: { msg: 'Car was created' }, status: :created
    else
      render json: { errors: car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      render json: { msg: 'Car has been updated' }
    else
      render json: { errors: @car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @car.destroy
      render json: { msg: 'Car has been deleted' }
    else
      render json: { errors: @car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car)
          .permit(:owner_id, :car_make_id, :car_model_id, :year, :latitude, :longitude, :range)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def set_car_params
    @latitude  = params[:latitude]
    @longitude = params[:longitude]
    @range     = params[:range]
  end
end
