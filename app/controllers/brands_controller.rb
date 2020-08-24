class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in

    
    def index 
        @brands = Brand.all
    end 

    def show 
        @brand = Brand.find_by(params[:id])
    end 

    def destroy 
        @brand = Brand.find_by_id(params[:id])
        @brand.destroy 
        redirect_to brands_path
    end 

    def edit 
        @brand = Brand.find_by_id(params[:id])
    end 

    def update  
        @brand = Brand.find_by_id(params[:id])
        @brand.update(params.require(:brand).permit(:name))
        redirect_to  brand_path(@brand)
    end 


 
end
