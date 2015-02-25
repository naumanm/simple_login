class AccessController < ApplicationController

  before_action :prevent_login_signup, only: [:signup, :login]

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to "/home"
    else
      render :signup
    end
  end

  def signup
    @user = User.new
  end

  def login
  end

  def home
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end

  def prevent_login_signup
    if session[:id]
      redirect_to home_path
    end
  end


end
