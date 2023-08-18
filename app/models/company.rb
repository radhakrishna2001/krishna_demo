class Company < ApplicationRecord
  has_many :products
  has_many :employees, :dependent => :destroy
  accepts_nested_attributes_for :employees
  has_and_belongs_to_many :customers
  has_many :users 
  
  #validates :
  validates :name,:owner_name,:address,  presence: true
  validates :name,:owner_name,:address,  format:{with:/\A[a-zA-Z ]+\z/,message:"only allows letters" }

end
