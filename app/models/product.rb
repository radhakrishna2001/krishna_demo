class Product < ApplicationRecord
  belongs_to :company

  validates :product_name, :price, presence: true
end
