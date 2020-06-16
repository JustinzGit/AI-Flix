class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_login

  def require_login
    if session[:user_id].nil?
      flash[:alert] = "You must be logged in."
      redirect_to login_path
    end
  end

  def redirect_home_if_logged_in
    if !session[:user_id].nil?
      flash[:alert] = "You're already logged in."
      redirect_to homepage_path
    end
  end

  def redirect_home_if_not_authorized
    flash[:alert] = "You're not authorized to access this page"
    redirect_to homepage_path
  end
end
