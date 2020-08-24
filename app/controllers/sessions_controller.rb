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
       redirect_to root_path
    end 

    def omniauth    
         @user = User.find_or_create_with_google(auth)
         if @user.save
           session[:user_id] = @user.id
           redirect_to user_path(@user)
         else 
           flash[:error] = "There's already an account with that email address"
           redirect_to login_path
         end 
    end  
      

    private 

    def auth 
        request.env['omniauth.auth']
    end 

end
