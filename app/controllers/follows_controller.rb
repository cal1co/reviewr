class FollowsController < ApplicationController

    before_action :find_like, only: [:destroy]
    before_action :find_post  
    def create
        if follow_safe
            flash[:notice] = "You've already liked this post"
        else
        @post.likes.create(user_id: @current_user.id)
        end
        redirect_to home_path
    end  
    
    def destroy
        if !(follow_safe)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to home_path
    end
    def find_like
        @post = Review.find(params[:review_id])
        @like = @post.likes.find(params[:id])
     end
    
    private  
    def find_post
        @post = Review.find(params[:review_id])
    end
    def already_liked?
        Like.where(user_id: @current_user.id, review_id:
        params[:review_id]).exists?
    end
    
    end
    