# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  # before_action :authenticate_user, except: %i[create]

  def index
    @users = User.all
    render json: { users: @users }
  end

  def show
    render json: { user: @user }
  end

  def create
    user = User.new(user_params)
    if user.save
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      render json: { msg: "User ##{user.id} was created", token: token }, status: :created
    else
      render_error(user)
    end
  end

  def update
    if @user.update(user_params)
      render json: { msg: "User ##{@user.id} has been updated" }
    else
      render_error(@user)
    end
  end

  def destroy
    if @user.destroy
      render json: { msg: "User ##{@user.id} has been deleted" }
    else
      render_error(@user)
    end
  end

  private

  def user_params
    params.permit(:first_name,
                  :last_name,
                  :username,
                  :email,
                  :password,
                  :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
