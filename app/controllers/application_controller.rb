class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  before_action :require_login

  def require_login
    if session[:user_id].nil?
      flash[:alert] = "You must be logged in."
      redirect_to login_path
    end
  end
end
