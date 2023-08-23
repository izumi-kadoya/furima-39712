class Item < ApplicationRecord
  
  validates :title, presence: true
  # 出品動作確認完了後、バリデーション追加する
  
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :duration
  belongs_to_active_hash :prefecture
  
end
