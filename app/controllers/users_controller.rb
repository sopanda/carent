# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[create]

  def index
    render_200(User.all)
  end

  def unverified
    render_200(User.unverified)
  end

  def show
    render_200(user)
  end

  def create
    created_user = User.create(user_params)
    return render_error(created_user) if created_user.errors.present?

    token = Knock::AuthToken.new(payload: { sub: created_user.id }).token
    render_200(jwt: token)
  end

  def update
    user.update(user_params)
    return render_error(user) if user.errors.present?
    render_200(user)
  end

  def destroy
    user.destroy
    head :ok
  end

  def profile
    render_200(current_user)
  end
  private

  def user_params
    params.permit(:first_name,
                  :last_name,
                  :username,
                  :email,
                  :phone_number,
                  :password,
                  :password_confirmation,
                  :photo)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
