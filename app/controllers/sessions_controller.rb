class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.check(params[:session][:email], params[:session][:password])
    if user
      redirect_to root_path
      flash[:success] = "You are succesfully logged"
    else
      render 'new'
      flash.now[:danger] = "Invalid user/pass combination"
    end
  end
end
