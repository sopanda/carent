class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request
  
  private
  
  def not_found
    render json: { error: 'Not found' }, status: :not_found
  end
  
  def bad_request
    render json: { error: 'Something went wrong' }, status: :bad_request
  end
end
