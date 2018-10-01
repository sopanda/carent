class HomeController < ApplicationController
  def index
    render json: 'hello world'
  end
end
