class User < ApplicationRecord # notes from Luke's lesson -->

    # before_destroy :destroy_associated_items
    has_secure_password

    has_many :reviews, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy


    has_and_belongs_to_many :lists
    
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    # We want users to be able to follow other users
    # This creates two different relationships, since a follow is not 'symmetrical'
    # You can follow another user, without that user following you back 
    # i.e. we want to have 
        # u1.followers - the users that are following u1
        # u2.following - the users that u1 is following 

    # We actually need to create another model - follow
    # ... this will be like a kind of join table, but its also a model 


    # This lets us write
    # User.first.following.relationships
    # to get a list of who this user is following, BUT you get an array 
    # of Follow objects, so to get to the User object you are following,
    # you need to write something awkward like 
    #   User.first.following_relationships.first.followed 
    has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id'
    has_many :followed_relationships, class_name: 'Follow', foreign_key: 'followed_id'

    # If we add a 'through' association, then we get the 'User.first.following' syntax 
    # we want, AND it will be a list of actual User objects (not Follow objects)
    has_many :following, through: :following_relationships, source: :followed
    has_many :followers, through: :followed_relationships, source: :follower     

    # So now we can ask "who is the first user following?" by writing
    #       User.first.following
    # and we get an array of User objects
    # 
    # AND we have a nice syntax for adding a follow, the same as a many-to-many association:
    # 
    # User.first.following << User.second
    # 
    # (which you could also write as) User.second.followers << User.first
    # 
    # i.e. the Follow model is now invisible/transparent - we never really need to 
    # talk to it directly, we use our new User associations following/followers instead 


    # !!!!! User.first.following.include? User.second !!!!!


    # Let's add a model method that lets a user follow another user, But also checks
    # that they aren't already following them (i.e. avoid duplicates)
    # i.e. we will run @current_user.follow_safe(@other_user)
    # ... in the above example, we can access @current_user inside the method
    # as 'self' (which is like Javascripts's 'this')
    def follow_safe( user_to_follow )
        
        if self.following.include? user_to_follow
            return false
        else
            self.following << user_to_follow
           return true
       end # if/else 

    end # follow_safe

    def following_reviews
        Review.where user: self.following 
        # TODO: look up 'User.joins(:reviews)' for a preferred syntax 
    end
    # Review.where user_id: User.first.following.ids

    private 
    def destroy_associated_items
        puts "hello"
        likes.destroy_all
        reviews.destroy_all
        true
    end #destroy_associated_items

end # class User
