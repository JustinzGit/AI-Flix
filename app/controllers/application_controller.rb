class ApplicationController < ActionController::Base
  before_action :require_login
  
  def require_login
    redirect_to login_path if session[:user_id].nil?
  end
end
