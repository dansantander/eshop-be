class RegistrationsController < ApplicationController
  def create
    user = User.new(
      username: registration_params[:username],
      email: registration_params[:email],
      password: registration_params[:password],
      password_confirmation: registration_params[:password_confirmation]
    )

    if user.save
      render json: {
        signed_in: true,
        user: { id: user.id, username: user.username, email: user.email }
      }
    else
      render json: { errors: user.errors.messages.first.join(' ') }, status: :not_acceptable
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:username, :email, :password, :password_confirmation)
  end
end
