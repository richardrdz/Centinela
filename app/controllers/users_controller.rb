class UsersController < ApplicationController
  def create
    if User.exists?(userName: user_params[:userName])
      render json: { statusCode: 450, statusMessage: "usuario ya existente" }
    elsif User.exists?(email: user_params[:email])
      render json: { statusCode: 451, statusMessage: "correo ya existe" }
    else
      user = User.new(user_params)
      if user.save
        payload  = { user_id: user.id,
                     user_name: user.userName}
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        tokens = session.login
        render json: { access: tokens[:access], payload: payload }
      else
        render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
      end
    end
 end
 def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end
 private

  def user_params
    params.permit(:email, :userName, :password, :password_confirmation)
  end
end
