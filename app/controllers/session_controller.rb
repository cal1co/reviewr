class SessionController < ApplicationController
  def new
  end

  def create
   
   
   
    # 1. Check in the email address is actually in the DB 
    user = User.find_by email: params[:email]

    # 2. Did we actually find a user row for that email address (or was it nil?)
    # AND if we did find a user ,is the password the correct one for that user
    if user.present? && user.authenticate(params[:password])

      # credentials are correct - successful login !
      session[:user_id] = user.id

      redirect_to root_path

    else  

      # Either the email was nil (no such email address), or the password entered into
      # the login form, when encrypted, did not match the password_digest stored
      # for this account 

      
      # The flash hash is a bit like 'session' in that it is remembered across
      # page requests, i.e. into the future - BUT ONLY for the very next page
      # load, and then not beyond that. This allows us to show error or status
      # messages about something that heppened on the previous request - i.e.
      # show an error message when redirected to this login for (or, for example
      # when successfully creating an item and being redirected to the index
      # page we can say 'Item created successfully').
      flash[:error] = 'Invalid email or password'
      
      redirect_to login_path

    end 

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
