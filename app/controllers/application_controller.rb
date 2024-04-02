class ApplicationController < ActionController::API
  def respond_with_error(message, status = 500)
    render json: { error: message }, status: status
  end
end
