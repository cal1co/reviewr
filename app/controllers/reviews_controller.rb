class ReviewsController < ApplicationController

    before_action :check_if_logged_in, only: [:new, :create]
    # except: is opposite of only: 
    def new
        @review = Review.new
    end

    def create
        # review = Review.create review_params
        # review.user_id = @current_user.id
        # review.save

        @review = Review.new review_params 
        @review.user_id = @current_user.id
        @review.save 

        
        if @review.update review_params
            redirect_to home_path
        else
            render :new
        end 

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