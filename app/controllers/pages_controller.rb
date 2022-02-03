class PagesController < ApplicationController

    before_action :check_if_logged_in

    def home
        @reviews = Review.order(created_at: :desc)
        @lists = List.order(created_at: :desc)
        @users = User.all

        # @review = Review.find params[:id]

        # if params[:review][:image].present?
        #     response = Cloudinary::Uploader.upload(params[:review][:image])
        #     @review.image=response['public_id']
        # end
    end

end
