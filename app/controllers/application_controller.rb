class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    User.find(session[:user_id])
  end

  def require_login
    if session[:user_id].nil?
      flash[:alert] = "You must be logged in."
      redirect_to login_path
    end
  end
end
