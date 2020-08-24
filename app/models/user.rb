class User < ApplicationRecord
    has_many :reviews 
    has_many :reviewed_laptops, through: :reviews, source: :laptops 
    has_many :laptops
    validates :username, uniqueness: true, presence: true  
    has_secure_password


    def self.find_or_create_with_google(auth)
        where(username: auth.info.email).first_or_initialize do |u|
            u.username = auth.info.email
            u.password = SecureRandom.hex
        end 
    end 


end 
