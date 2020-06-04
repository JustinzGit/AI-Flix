class UsersController < ApplicationController

  def homepage
    @user = User.find(session[:user_id])
  end

  # GET SignUp
  def new
    @user = User.new
  end

  # POST SignUp 
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to homepage_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
