class FollowersController < ApplicationController
  
    def index
        @user = User.find params[:user_id]
        @user.followers

    end # index()

end # FollowersController
