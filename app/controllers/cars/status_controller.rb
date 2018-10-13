class Cars::StatusController < ApplicationController
  before_action :authenticate_user

  def update
    car = Car.find(params[:car_id])
    if car.update(car_state_params)
      render json: { msg: 'Car status has been updated' }
    else
      render json: { errors: @car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def car_state_params
    params.require(:car).permit(:status)
  end
end