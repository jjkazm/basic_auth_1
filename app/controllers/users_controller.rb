class UsersController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      redirect_to root_path
      login(@user)
      flash[:success] = "Welcome in the authorisation app. The only app where you can signup and nothing else:)"
    else
      render 'new'
    end
  end

end
