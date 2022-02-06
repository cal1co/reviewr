class ListsController < ApplicationController # not implemented !!

    def new
        @reviews = Review.all
        @list = List.new
    end # new()

    def create
        List.create list_params
        redirect_to home_path
    end # create()

    def edit
        @review = Review.find params[:id]
        redirect_to login_path unless @review.user_id == @current_user.id
    end # edit()

    def update
        @review = Review.find params[:id]
        redirect_to login_path and return unless @review.user_id == @current_user.id
        @review.update review_params
        redirect_to review_path(@review)

    end # update()

    def show
        @list = List.find params[:id]
    end # show()

    def destroy
        List.destroy params[:id]
        redirect_to home_path
    end # destroy()

    def list_params # !!!!!
        params.require(:list).permit(:title,:image,:user_id)
    end # list_params()

end # ListsController