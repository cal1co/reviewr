class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    user_em = User.find_by email: params[:email]
    user_name = User.find_by username: params[:username]
    # if user_name.present? 
      # raise 'hell'
      session[:user_id] = @user.id
      redirect_to home_path
    # end

  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:username, :image, :email, :password)
  end

end