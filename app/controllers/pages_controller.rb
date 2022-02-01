class PagesController < ApplicationController

    before_action :check_if_logged_in

    def home
        @reviews = Review.order(created_at: :desc)
        @lists = List.order(created_at: :desc)
        @users = User.all
    end

end
