class SessionsController < ApplicationController


    def welcome 

    end 


    def new 
       
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
       if @user && @user.authenticate(password: params[:user][:password])
          session[:user_id] = @user.id 
          redirect_to user_path(@user)
       else 

    end 

    def destroy 
       session.destroy 
       redirect_to '/'
    end 

end
