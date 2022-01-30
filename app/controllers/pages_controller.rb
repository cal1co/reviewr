class PagesController < ApplicationController
    def home
        @reviews = Review.order(created_at: :desc)
        @lists = List.order(created_at: :desc)
    end

end
