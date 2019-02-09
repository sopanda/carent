# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_user

  def index
    render_200(current_user.bookings)
  end

  def show
    render_200(current_user.bookings.find(params[:id]))
  end
end
