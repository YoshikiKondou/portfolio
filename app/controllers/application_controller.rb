class ApplicationController < ActionController::Base
  before_action :set_login_user

  def set_login_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
