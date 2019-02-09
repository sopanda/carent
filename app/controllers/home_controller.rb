# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: { msg: 'hello world' }
  end
end
