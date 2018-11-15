class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.check(params[:session][:email], params[:session][:password])
    if user
      login(user)
      redirect_to root_path
      flash[:success] = "You are succesfully logged"
    else
      render 'new'
      flash.now[:danger] = "Invalid user/pass combination"
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
