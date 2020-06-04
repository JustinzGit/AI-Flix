class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end
end
