class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path, notice: 'User was successfully updated'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password, :about)
  end

end
