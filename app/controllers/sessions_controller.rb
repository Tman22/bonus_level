class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in"
      if current_admin?
        redirect_to admin_user_path(@user)
      else
        redirect_to user_path(@user)
      end
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