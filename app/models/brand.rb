class Brand < ApplicationRecord
    has_many :laptops, dependent: :destroy
  
end
