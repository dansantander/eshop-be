class SessionsController < ApplicationController
  def create
    user = User
      .find_by(email: params['user']['email'])
      .try(:authenticate, params['user']['password'])
    if user
      render json: {
        logged_in: true,
        user: { id: user.id, username: user.username, email: user.email }
      }
    else
      render json: {
        errors: 'Invalid user or password'
      }
    end
  end
end
