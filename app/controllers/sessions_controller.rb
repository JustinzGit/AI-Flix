class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    if auth_hash
      @user = User.find_or_initialize_by(uid: auth_hash[:uid])
      @user.username = auth_hash[:info][:nickname]
      @user.save(validate: false)
      session[:user_id] = @user.id
      redirect_to homepage_path
    
    elsif @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to homepage_path
      end 
    else
      redirect_to login_path
    end 
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end 
end
