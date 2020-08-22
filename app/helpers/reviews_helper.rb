module ReviewsHelper

    def display_header(review)

        if params[:laptop_id] 
            content_tag(:h1, "Add a Review for #{@review.laptop.color}  -  #{@review.laptop.brand.name}")
        else
            content_tag(:h1, 'Create a review')
        end
    end 


end
