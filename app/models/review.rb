class Review < ApplicationRecord
  belongs_to :user
  belongs_to :laptop

  validates :title, presence: true 
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :laptop, uniqueness: {scope: :user , message: "has been reviewed by you"}

end
