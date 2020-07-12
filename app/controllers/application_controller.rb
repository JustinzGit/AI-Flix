class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_login

  def logged_in?
    !!current_user
  end 

  def require_login
    if !logged_in?
      flash[:alert] = "You must be logged in."
      redirect_to login_path
    end
  end

  def redirect_home_if_logged_in
    if logged_in?
      flash[:alert] = "You're already logged in."
      redirect_to homepage_path
    end
  end

  def redirect_if_not_authorized(collection, instance)
    if !logged_in? || !collection.include?(instance)
      flash[:alert] = "You're not authorized to access this page"
      redirect_to homepage_path
    end 
  end
end
