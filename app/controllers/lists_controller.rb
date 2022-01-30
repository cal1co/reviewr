class ListsController < ApplicationController

    def new
        @reviews = Review.all
        @list = List.new
    end

    def create
        List.create list_params
        redirect_to home_path
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