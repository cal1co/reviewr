class UsersController < ApplicationController
  def new
    @user = User.new
  end

  


  def create
    user_em = User.find_by email: params[:email]
    user_name = User.where username: params[:username]
    @user = User.create user_params
    # raise 'hell'
    
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to home_path
      
    else
      flash[:error] = 'Invalid email or password'
      redirect_to new_user_path

    end # create() if/else

  end #create()

  def edit
    @user = User.find params[:id]
  end

  def update
    # @user = User.find params[:id]
    # raise 'hell'
    @current_user.bio = params[:user][:bio]
    @current_user.birthday = params[:user][:birthday]
    @imageset = true
    # raise 'hell'

    if params[:user][:image].present?
      response = Cloudinary::Uploader.upload(params[:user][:image])
      @current_user.image=response['public_id']
    end

    @current_user.save
    # @user.update! user_params
    redirect_to user_path(params[:id])
    
  end # edit 

  def destroy
  end


  def show
    @user = @current_user
    @userinfo = User.find params[:id]
    @userimg = Identicon.data_url_for @userinfo.username, 400
  end

  private
  def user_params
     params.require(:user).permit(:username, :image, :email, :password)
  end

end