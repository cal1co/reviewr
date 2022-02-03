class CommentsController < ApplicationController


        before_action :find_like, only: [:destroy]
        before_action :find_post  

        def new
          raise 'hell'
          @comment = @post.comment.new
        end
        def create
          @comment = @post.comments.new comment_params
          @comment.user_id = @current_user.id
          @post.comments << @comment
          @comment.save

        if @comment.update comment_params
          redirect_to review_path(@post.id)
        else  
          render :new
        end
      end
        
        def destroy

        Comment.destroy params[:id]
            redirect_to review_path(@post.id)
        end


        def find_like
            @post = Review.find(params[:review_id])
            @like = @post.likes.find(params[:id])
         end
        
        private  
        def find_post
            @post = Review.find(params[:review_id])
        end

        def comment_params # !!!!!
          params.require(:comment).permit(:reply,:user_id,:review_id)
        end 


end