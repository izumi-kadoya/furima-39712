class Item < ApplicationRecord
  
  validates :title, :detail, :category_id, :condition_id, :fee_id, :prefecture_id, :duration_id, :price, presence: true
  
  
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :duration
  belongs_to_active_hash :prefecture
  
end
