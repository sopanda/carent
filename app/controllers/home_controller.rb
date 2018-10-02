class HomeController < ApplicationController
  before_action :authenticate_user

  def index
    render json: 'hello world'
  end
end
