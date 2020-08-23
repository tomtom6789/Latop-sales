class SessionsController < ApplicationController
    
    def welcome 
        if logged_in?
            redirect_to user_path(current_user)
        end 
    end 


    def new 
       
    end 

    def create 
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:error] = "Sorry, Please reenter"
            redirect_to login_path
        end 

    end 



    def destroy 
       session.destroy 
       redirect_to '/'
    end 

end
