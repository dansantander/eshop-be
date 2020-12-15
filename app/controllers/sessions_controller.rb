class SessionsController < ApplicationController
  def create
    user = User
    .find_by(email: params[:session][:email])
    .try(:authenticate, session_params[:password])
    if user
      render json: {
        logged_in: true,
        user: { id: user.id, username: user.username, email: user.email }
      }
    else
      render json: { errors: 'Invalid email or password' }, status: :not_acceptable
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
