class Laptop < ApplicationRecord
    belongs_to :brand 
    belongs_to :user 

    has_many :reviews
    has_many :users, through: :reviews


    validates :brand, :color, :condition, :price , presence: true 
    validates :price, numericality: { only_integer: true, greater_than: 0}
    validates :color, uniqueness: {scope: :brand, message: "has already been used with that brand"}
    validate :color_check
    
    
    scope :order_by_ratings, -> {joins(:reviews).group(:id).order('avg(stars) desc')}
    scope :order_by_prices, -> {order(:price)}
    scope :new_laptops, -> {where('condition = ?', 'new')}
    scope :most_expensive, -> {where(price: Laptop.maximum('price')).last}
    
   

    def brand_attributes=(attributes)
        if !attributes[:name].blank?
            self.brand = Brand.find_or_create_by(attributes)
        end 
    end 

    def color_check 
        if color.split(" ").count > 3 
            errors.add(:color, "must be 1 or 2 words")
        end 
    end 

  
    def color_and_brand 
        "#{color} - #{brand.try(:name)}"
    end 

    def brand_name 
        brand.try(:name)
    end 

    
  


end
