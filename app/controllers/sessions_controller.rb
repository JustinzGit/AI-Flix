class SessionsController < ApplicationController
  skip_before_action :require_login

  # GET Login
  def new
    @user = User.new
  end

  # POST Login
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      redirect_to login_path
    end
  end

  # GET Logout
  def destroy
    session.clear
    redirect_to login_path
  end
end
