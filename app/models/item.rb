class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :condition
  has_many :item_images
  accepts_nested_attributes_for :item_images,allow_destroy: true
end
