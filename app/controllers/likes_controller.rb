class LikesController < ApplicationController

before_action :find_like, only: [:destroy]
before_action :find_post  
def create
    if already_liked?
        flash[:notice] = "You've already liked this post"
    else
    @post.likes.create(user_id: @current_user.id)
    add_like = @post.like_count + 1
    @post.update(like_count: add_like)
    end
    # redirect_to home_path
    
    # redirect_back(fallback_location: root_path)
end  

def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
        @like.destroy
        delete_like = @post.like_count - 1
        @post.update(like_count: delete_like)
    end
    # redirect_to home_path
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
