class LaptopsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_laptop, only: [:edit, :update, :show, :destroy]


    def index   
        if @brand = Brand.find_by_id(params[:brand_id])
           @laptops = @brand.laptops
        else 
           @laptops = Laptop.order_by_prices.search(params[:search])
        end 
    end 
    


    def show 
     
    end 



    def new 
        @laptop = Laptop.new 
        @laptop.build_brand
    end 


    def create
        @laptop = Laptop.new(laptop_params)
        @laptop.user_id = session[:user_id]

        if @laptop.save
            redirect_to laptop_path(@laptop)
        else 
            render :new 
        end 
    end 



    def edit 
    
    end 


    def update 
        @laptop.update(laptop_params)
        redirect_to laptop_path(@laptop)
    end 


    def destroy 
        @laptop.destroy
        redirect_to laptops_path
    end 
    



   
    def expensive 
        @laptop = Laptop.most_expensive
    end 


  

    private 

    def laptop_params
        params.require(:laptop).permit(:color, :condition, :price, :brand_id, :search, brand_attributes: [:name])
    end 

    def set_laptop
        @laptop = Laptop.find_by_id(params[:id])
    end 
end
