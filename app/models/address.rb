class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :user, optional: true

  
  validates :first_name,              presence: true
  validates :last_name,               presence: true
  validates :first_name_kana,         presence: true
  validates :post_number,             presence: true
  validates :city,                    presence: true
  validates :area_id,                 presence: true
  validates :address_number,          presence: true
end
