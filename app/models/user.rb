class User < ApplicationRecord
    has_many :reviews 
    has_many :reviewed_laptops, through: :reviews, source: :laptops 
    
    has_many :laptops

    
    validates :username, uniqueness: true, presence: true 
  
    has_secure_password
  
end 
