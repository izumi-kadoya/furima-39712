class Item < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :duration
  belongs_to_active_hash :prefecture

  validates :title, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :fee_id, :prefecture_id, :duration_id, presence: true,
                                                                                numericality: { other_than: 1, message: "can't be blank" }
  validate :image_check

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  private
  def image_check
    errors.add(:image, 'must be attached.') unless image.attached?
  end
end
