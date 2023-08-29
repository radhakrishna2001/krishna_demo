class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #validates :email , presence: true
  enum role: {emp:0, admin:1}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
   accepts_nested_attributes_for :company
    validates :first_name, presence: true
    validates :last_name, presence: true
end
