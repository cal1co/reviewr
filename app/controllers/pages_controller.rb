class PagesController < ApplicationController

    before_action :check_if_logged_in

    def home
        @reviews = Review.order(created_at: :desc)
        @lists = List.order(created_at: :desc)
        @users = User.all
        @review = Review.new

        # @review = Review.find params[:id]

        # if params[:review][:image].present?
        #     response = Cloudinary::Uploader.upload(params[:review][:image])
        #     @review.image=response['public_id']
        # end
    end

    def new
        @review = Review.new
    end
    def create
        raise 'hell'
        @review = Review.new review_params 
        @review.user_id = @current_user.id
        
        if params[:review][:image].present?
            response = Cloudinary::Uploader.upload(params[:review][:image])
            @review.image=response['public_id']
        end
        
        # @review.save 

        
        if @review.update review_params
        # if @review.save review_params
            redirect_to home_path
        else
            render :new
        end 
    end

    def feed
        @reviews = Review.order(created_at: :desc)
    end


end
