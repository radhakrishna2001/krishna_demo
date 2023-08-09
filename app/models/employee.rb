class Employee < ApplicationRecord
  belongs_to :company

  validates :name,:email,:contact,  presence: true
  validates :contact, numericality:{ only_integer: true, message: "Only integer values are allowed"},
                                  length: { is: 10, message: "number must be exactly 10 digits" }
  validates :name,format:{with:/\A[a-zA-Z ]+\z/,message:"only allows letters" }
end