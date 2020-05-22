class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :birth_yy, :birth_mm, :birth_dd, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number,presence: true
  
  has_many :items
  has_one :card
  has_one :address
  accepts_nested_attributes_for :address
  
end
