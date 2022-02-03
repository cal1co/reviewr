class FollowingController < ApplicationController
  
    def show
        @user = User.find params[:id]
        @user.following
    end
end 
