class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :categorys
  has_many :item_images
  accepts_nested_attributes_for :item_images
end
