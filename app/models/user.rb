class User < ApplicationRecord

    # before_destroy :destroy_associated_items
    has_secure_password

    has_many :reviews, dependent: :destroy
    has_many :likes, dependent: :destroy



    has_and_belongs_to_many :lists
    
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    private 
    def destroy_associated_items
        puts "hello"
        likes.destroy_all
        reviews.destroy_all
        true
    end

end
