class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_login

  def require_login
    if !logged_in?
      redirect_to login_path
    end
  end

  def redirect_home_if_logged_in
    redirect_to homepage_path if logged_in?
  end
end
