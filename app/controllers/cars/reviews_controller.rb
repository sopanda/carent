# frozen_string_literal: true

module Cars
  class ReviewsController < ApplicationController
    before_action :authenticate_user

    def index
      render_200(car.reviews)
    end

    def show
      render_200(review)
    end

    def create
      created_review = car.reviews.create(review_params.merge(author: current_user))
      return render_error(created_review) if created_review.errors.present?
      render_200(created_review)
    end

    def update
      review.update(review_params)
      return render_error(review) if review.errors.present?
      render_200(review)
    end

    def destroy
      review.destroy
      head :ok
    end

    private

    def review_params
      params.permit(:user_id, :text, :rating)
    end

    def car
      @car ||= Car.find(params[:car_id])
    end

    def review
      @review ||= car.reviews.find(params[:id])
    end
  end
end
