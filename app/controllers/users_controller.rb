class UsersController < ApplicationController
  skip_before_action :require_login, except: [:homepage]
 
  # GET /users/new (Signup Page)
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.invalid?
      render :new
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to homepage_path
      LoadAppDataJob.perform_later
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
