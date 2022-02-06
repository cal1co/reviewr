class ReviewsController < ApplicationController

    before_action :check_if_logged_in, only: [:new, :create]

    def new
        @review = Review.new
    end # new()

    def create
        @review = Review.new review_params 
        @review.user_id = @current_user.id
        
        if params[:review][:image].present?
            response = Cloudinary::Uploader.upload(params[:review][:image])
            @review.image=response['public_id']
        end
        
        if @review.update review_params
            redirect_to home_path
        else 
            p @review.errors 
            redirect_to home_path
        end 

    end # create()

    def show
        @review = Review.find params[:id]
    end # show()

    def destroy
        Review.destroy params[:id]
        redirect_to home_path
    end # destroy()

    def review_params # !!!!!
        params.require(:review).permit(:title,:strength,:weakness,:user_id,:rating)
    end # review_params()

end # ReviewsController