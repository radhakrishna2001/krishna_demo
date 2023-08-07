class Customer < ApplicationRecord
  has_and_belongs_to_many :companies 



  #validates 
  validates :name, presence: true 
  validates :name, format:{with:/\A[a-zA-Z ]+\z/,message:"only allows letters" }
  validates :contact, presence: true, numericality:{ only_integer: true, message: "Only integer values are allowed"},
                                  length: { is: 10, message: "number must be exactly 10 digits" }
end
