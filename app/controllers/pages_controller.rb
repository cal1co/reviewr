class PagesController < ApplicationController

    before_action :check_if_logged_in

    def home
        @reviews = Review.order(created_at: :desc)
        @lists = List.order(created_at: :desc)
        @users = User.all
        @review = Review.new

        users_likes = []
        Like.all.each {|e| users_likes.push(e.review.user_id)}
        freq = users_likes.inject(Hash.new(0)) {|h,v| h[v] += 1; h}.sort{|a, b| a[1] <=> b[1]}.reverse

        @gold = User.find_by id:freq[0][0]
        @silver = User.find_by id:freq[1][0]
        @bronze = User.find_by id:freq[2][0]

    end # home()

    def new
        @review = Review.new
    end # new()

    def create
        @review = Review.new review_params 
        @review.user_id = @current_user.id
        
        if params[:review][:image].present?
            response = Cloudinary::Uploader.upload(params[:review][:image])
            @review.image=response['public_id']
        end # if image present
        
        if @review.update review_params
            redirect_to home_path
        else
            render :new
        end 

    end # create()

    def feed
        @reviews = Review.order(created_at: :desc)
    end # feed()

    def popular
        @reviews = Review.order(like_count: :desc)
    end # popular()

end # PagesController
