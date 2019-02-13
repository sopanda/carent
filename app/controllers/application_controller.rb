# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def render_200(data)
    render json: data,
           status: :ok,
           content_type: 'application/vnd.api+json'
  end

  def render_error(data)
    render json: { errors: data.errors.full_messages },
           status: :unprocessable_entity
  end

  def render_text_error(msg)
    render json: { errors: msg },
           status: :unprocessable_entity
  end

  private

  def not_found
    render json: { errors: ['Not found'] }, status: :not_found
  end
end
