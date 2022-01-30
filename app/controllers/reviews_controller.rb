class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end

    def create
        Review.create review_params
        redirect_to home_path
    end


    def show
        @review = Review.find params[:id]
    end

    def destroy
        Review.destroy params[:id]
        redirect_to home_path
    end

    def review_params # !!!!!
        params.require(:review).permit(:title,:image,:strength,:weakness,:user_id,:rating)
      end 

    end