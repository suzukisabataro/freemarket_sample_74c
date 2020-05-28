class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :user, optional: true

  
  validates :first_name,              presence: true, on: :validates_step3
  validates :last_name,               presence: true, on: :validates_step3
  validates :first_name_kana,         presence: true, on: :validates_step3
  validates :last_name_kana,          presence: true, on: :validates_step3
  validates :post_number,             presence: true, numericality: true, on: :validates_step3
  validates :city,                    presence: true, on: :validates_step3
  validates :area_id,                 presence: true, on: :validates_step3
  validates :address_number,          presence: true, on: :validates_step3
end
