class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account Created!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :image_path)
  end
end