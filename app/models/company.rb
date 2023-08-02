class Company < ApplicationRecord
  has_many :employees
  has_many :products
  has_many :employees, :dependent => :destroy

  
  #validates :
  validates :name,:owner_name,:address,  presence: true
  validates :name,:owner_name,:address,  format:{with:/\A[a-zA-Z ]+\z/,message:"only allows letters" }

end
