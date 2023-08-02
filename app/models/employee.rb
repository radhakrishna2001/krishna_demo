class Employee < ApplicationRecord
  belongs_to :company

  validates :name,:email,:contact,  presence: true
  validates :contact, numericality:{ only_integer: true, message: "Only integer values are allowed"}
end
