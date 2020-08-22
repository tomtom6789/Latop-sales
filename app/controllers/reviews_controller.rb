class ReviewsController < ApplicationController

   
    def new 

        if @laptop = Laptop.find_by_id(params[:laptop_id])
           @review = @laptop.reviews.build
        else 
           @review = Review.new 
        end 
    end 


    def show
        @review = Review.find_by_id(params[:id])
    end 


    def index

        if @laptop = Laptop.find_by_id(params[:laptop_id])
           @reviews = @laptop.reviews
        else 
            @reviews = Review.all
        end 
    end 

    def create

        @review = current_user.reviews.build(review_params)

        if @review.save
            redirect_to review_path(@review)
        else 
            render :new
        end 
    end 


    private 

    def review_params
        params.require(:review).permit(:laptop_id, :content, :stars, :title)
    end 

 

  
end
