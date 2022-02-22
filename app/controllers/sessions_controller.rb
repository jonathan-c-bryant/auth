class SessionsController < ApplicationController

def new
end

def create
    entered_email = params["email"]
    entered_password = params["password"]
   
   #checking the email
    @user = User.find_by({email: entered_email})

    if @user # yes the email matchecs
        if BCrypt::Password.new(@user.password) == entered_password
            redirect_to "/companies"
        else
            #password doesn't match
    redirect_to "/sessions/new"       
   end
else
    #password doesn't match
redirect_to "/sessions/new"

flash[:notice] = "No user with address"


end

end
