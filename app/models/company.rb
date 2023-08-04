class Company < ApplicationRecord
  has_many :employees
  has_many :products
  has_many :employees, :dependent => :destroy
  has_and_belongs_to_many :customers

  
  #validates :
  validates :name,:owner_name,:address,  presence: true
  validates :name,:owner_name,:address,  format:{with:/\A[a-zA-Z ]+\z/,message:"only allows letters" }

end
