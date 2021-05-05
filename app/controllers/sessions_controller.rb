class SessionsController < ApplicationController
  skip_before_action :require_login

  # GET /login
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    # Ensure user is located and password is correct
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to homepage_path
    else
        flash[:alert] = "Invalid email or password"
        redirect_to login_path
    end 
  end

  # GET /logout
  def destroy
    session.clear
    redirect_to login_path
  end
end
