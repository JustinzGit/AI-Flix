class SessionsController < ApplicationController
  before_action :redirect_home_if_logged_in
  skip_before_action :redirect_home_if_logged_in, only: [:destroy]

  skip_before_action :require_login

  # GET Login
  def new
    @user = User.new
  end

  # POST Login
  def create
    if !auth_hash[:uid].nil?
      @user = User.find_or_create_by(uid: auth_hash[:uid]) do |u|
        u.username = auth_hash[:info][:nickname]
        u.email = auth_hash[:info][:email]
      end
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to homepage_path
      else
        redirect_to login_path
      end
    end
  end

  # GET Logout
  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def redirect_home_if_logged_in
    redirect_to homepage_path if !session[:user_id].nil?
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
