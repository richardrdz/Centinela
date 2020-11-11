class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  JWTSessions.csrf_header = "x_csrf_token"
  JWTSessions.access_header = "authorization"
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
  private
  def not_authorized
    render json: { error: 'Not authorized', statuscode: 401 }, status: :unauthorized
  end
end
