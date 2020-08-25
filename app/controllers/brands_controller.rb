class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_brand, only: [:show, :destroy, :edit, :update]
    
    def index 
        @brands = Brand.all
    end 

    def show 
     
    end 

    def destroy 
        @brand.destroy 
        redirect_to brands_path
    end 

    def edit 
      
    end 

    def update  
        @brand.update(params.require(:brand).permit(:name))
        redirect_to  brand_path(@brand)
    end 


    private 

    def set_brand
        @brand = Brand.find_by(params[:id])
    end 
 
end
