module LaptopsHelper

    def display_header_brand(brand)
        if @brand 
            content_tag(:h1, "#{@brand.name}") 
        else 
            content_tag(:h1, "All the Laptops") 
        end
    end 
    

end
