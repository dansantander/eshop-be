module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    # @current_user = User.find(session[:user_id]) if session[:user_id]
    @current_user = User.find(cookies[:user_id]) if cookies[:user_id]
  end
end
