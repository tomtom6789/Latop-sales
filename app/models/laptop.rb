class Laptop < ApplicationRecord
    belongs_to :brand 
    belongs_to :user 

    has_many :reviews
    has_many :users, through: :reviews


    validates :condition, presence: true 
    # validate :not_a_duplicate
    
    
    # scope :order_by_ratings, -> {joins(:reviews).group(:id).order('avg(stars) desc')}
    scope :order_by_prices, -> {order(:price)}
   

#    def self.prices
#        order(:price)
#    end 


    def brand_attributes=(attributes)
        # @brand = Brand.find_or_create_by(attributes) if !attributes[:name].empty?
        if !attributes[:name].blank?
            self.brand = Brand.find_or_create_by(attributes)
        end 
    end 


    # def not_a_duplicate
    #     if Laptop.find_by(color: color, brand_id: brand_id )
    #         errors.add(:color, "has already been added for thet brand" )
    #     end 
    # end 

    def color_and_brand 
        "#{color} - #{brand.try(:name)}"
    end 

    def brand_name 
        brand.try(:name)
    end 

    
  


end
