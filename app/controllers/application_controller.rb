require 'pry'
class ApplicationController < ActionController::Base
     helper_method :current_user , :logged_id?


    private 

    def logged_id?
        !!session[:user_id]
    end 


    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
    end 

    def redirect_if_logged_in 
        redirect_to user_path(current_user) if logged_in?
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_id?
    end 
end
