class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :condition
  # has_many :item_images
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images,allow_destroy: true
  validates :item_images,          presence: true
  validates :name,                presence: true, length: { maximum: 40 } 
  validates :description,         presence: true, length: { maximum: 1000 }
  validates :price,               presence: true, numericality:  { only_integer: true, greater_than: 300, less_than: 9999999 }
  validates :condition_id,        presence: true
  validates :delivery_charge_id,  presence: true
  validates :delivery_day_id,     presence: true
  validates :area_id,             presence: true
  validates :category_id,         presence: true
  belongs_to :user
  belongs_to :category
end
