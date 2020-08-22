class LaptopsController < ApplicationController


    def index 
        @laptops = Laptop.order_by_prices
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

    def show 
        @laptop = Laptop.find_by_id(params[:id])
    end 

    def destroy 
        @laptop = Laptop.find_by_id(params[:id])
        @laptop.destroy 
        redirect_to laptops_path
    end 


    private 

    def laptop_params
        params.require(:laptop).permit(:color, :condition, :price, :brand_id, brand_attributes: [:name])
    end 
end
