class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to user_path(user)
    else
      flash.now[:alert] = "User name or password are invalid"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
