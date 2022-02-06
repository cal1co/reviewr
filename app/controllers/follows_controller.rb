class FollowsController < ApplicationController

    before_action :find_like, only: [:destroy]
    before_action :find_post  

    def create
        if follow_safe
            flash[:notice] = "You've already liked this post"
        else
            @post.likes.create(user_id: @current_user.id)
        end # follow_safe if/else 

        redirect_to home_path

    end # create
    
    def destroy

        if !(follow_safe)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end # !follow_safe if/else 

        redirect_to home_path

    end # destroy

    def find_like
        @post = Review.find(params[:review_id])
        @like = @post.likes.find(params[:id])
    end # find_like
    
    private  
    def find_post
        @post = Review.find(params[:review_id])
    end # find_post()

    def already_liked?
        Like.where(user_id: @current_user.id, review_id:
        params[:review_id]).exists?
    end # already_liked?
    
end # FollowsController
    