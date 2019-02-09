# frozen_string_literal: true
module Users
  class ReviewsController < ApplicationController
    before_action :authenticate_user

    def index
      render_200(user.reviews)
    end

    def show
      render_200(review)
    end

    def create
      created_review = user.reviews.create(review_params.merge(author: current_user))
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

    def user
      @user ||= User.find(params[:user_id])
    end

    def review
      @review ||= user.reviews.find(params[:id])
    end
  end
end
