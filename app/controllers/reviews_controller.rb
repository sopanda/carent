class ReviewsController < ApplicationController
  #before_action :authenticate_user, except: %i[index show]
  before_action :set_booking, only: %i[index show update destroy]
  before_action :set_review, only: %i[update destroy]
  
  def index
    @reviews = @booking.reviews
    render json: @reviews
  end

  def show
    render json: @booking.reviews.find(params[:id])
  end

  def create
    review = @booking.reviews.new(review_params)
    if review.save
      render json: { msg: "Review ##{review.id} for Booking ##{@booking.id} was created" }, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      render json: { msg: "Review ##{@review.id} has been updated" }
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.destroy
      render json: { msg: "Review ##{@review.id} has been deleted" }
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review)
          .permit(:author_id, :booking_id, :text, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
