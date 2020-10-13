class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  def create
   user = User.find_by!(email: params[:email])
   if user.authenticate(params[:password])
     payload  = { user_id: user.id,
                  user_name: user.userName}
     session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
     tokens = session.login
     render json: { access: tokens[:access], csrf: tokens[:csrf], payload: payload }
   else
     not_authorized
   end
 end
 def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end
end
