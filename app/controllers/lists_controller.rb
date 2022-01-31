class ListsController < ApplicationController

    def new
        @reviews = Review.all
        @list = List.new
    end

    def create
        List.create list_params
        redirect_to home_path
    end

    def edit
        @review = Review.find params[:id]
        redirect_to login_path unless @review.user_id == @current_user.id
    end

    def update
        @review = Review.find params[:id]

        redirect_to login_path and return unless @review.user_id == @current_user.id

        @review.update review_params
        redirect_to review_path(@review)
    end


    def show
        @list = List.find params[:id]
    end

    def destroy
        List.destroy params[:id]
        redirect_to home_path
    end

    def list_params # !!!!!
        params.require(:list).permit(:title,:image,:user_id)
    end 

end