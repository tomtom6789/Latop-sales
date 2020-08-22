class BrandsController < ApplicationController
    
    def index 
        @brands = Brand.all
    end 

    def show 
        @brand = Brand.find_by_id(params[:id])
    end 

 
end
