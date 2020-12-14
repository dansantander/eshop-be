class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      username: params['user']['username'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )

    if user
      render json: {
        signed_in: true,
        user: user
      }
    else
      render json: {
        errors: user.errors.full_messages
      }
    end
  end
end
