class SessionsController < ApplicationController

def new
	
end

# Create Methot will allow to take the data passed by omniauth,
# & find or create the user that omniauth returns 
# and then store that user's id in the session

def create
user = User.from_omniauth(env["omniauth.auth"])
session[:user_id] = user.id
redirect_to root_url, notice: "Signed in!"
end

# To Log Out the User

def destroy
session[:user_id] = nil
redirect_to root_url, notice: "Signed out!"
end

end

