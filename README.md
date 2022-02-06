# README

# Simple Twitter Clone (WIP)

## MY SITE: https://cryptic-citadel-69958.herokuapp.com/users/new


## About this project:
Completed as project 1 for General Assembly class SEI-50

This project is an attempt at a simple social media platform like Twitter or Reddit. This project took far longer to implement seemingly simple features in comparison to my previous project, however, the final product consists of far few bugs and unintended features. The countless files and folders became quite overwhelming by the end which really negatively affected my ability to implement the final planned features. 


## Notable features:
- 'Reviews' are essentially tweets but with a 'title' column  
- 'Comments' can be attatched to 'Reviews' by any user for extended discussion
- Identicons (default profile images)
- Likes, followers, following (all dependents -- no errors when/if parents destroyed)
- Image posting
- User search
- Like and comment counters
- Total like counter for user (similar to reddit karma)

## Known bugs and unintended features:
- Forgot to write the confitional for profile pictures on posts (error if identicon) ! FIXED 5/2 <- new bug on Heroku though !
- 'already have an account?' button doesn't go to sign-in page ! FIXED 5/2 !
- Had to separate 'compose' area to a separate page to avoid areas. It would be better on the home page ! FIXED 5/2 !
- nav bar not sticky ! FIXED 5/2 !
- User followers and following links don't go anywhere anymore <- forgot I changed the routes ! FIXED 5/2 !

## Wishlist and housekeeping: 
- Fix jQuery for sign-up page ! FIXED 6/2 !
- A cleaner appearence for my pages would be nice 
- User search, already wrote the code, didn't use it on the page (can't use follower feed without it) ! COMPLETED 5/2 (can still improve this feature) !
- Move compose back to home page ! COMPLETED 5/2 !
- Ajax calls would fix a lot of the clunkiness of all the interactive features
- A sort-by drop down (also already wrote this, just need to implement <- would function more like Reddit posts) ! COMPLETED 5/2 <- unresponsive, would benefit from AJAX calls!
- Allow 2 images on compose. I didn't like the cloudinary widget, so I didn't add it. 
- Unsure about the list feature. It works fine, but it is extremely 'gimicky' and I can't see why it should exist. ('lists' are groupings of multiple 'reviews' in one single post)
- A header for user profile
- A tab for posts liked by a user (on their profile)
- Settings page should be far more extensive. 
- 


## Summary:
The main bulk of this project was done in one night (post creation and lists). As I added things, my momentum (focus) continually dropped until I could barely do anything without help (ty, Ro!). I made sure to fix all the bugs I had and triple checked every feature before moving on to the next one, so my final product is a lot more functional than my last one. I really regret not styling my pages earlier... they're so ugly!  


## Special Thanks:
Special thanks to Rowena. Even though I only asked for help later on, her assistance saved me hours of time and helped me to avoid a lot of additional errors. I really appreciate the help and wouldn't have been able to include some core features (or get to sleep early) without her. tysm! 


# reviewr
