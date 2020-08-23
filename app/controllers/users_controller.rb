class UsersController < ApplicationController
    #  before_action :redirect_if_not_logged_in, except: [:new, :create]

    def new 
        @user = User.new
    end 


    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end 

    def show
        @user = User.find_by_id(params[:id])
        redirect_to root_path if !current_user
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end 


end
