class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :street, :building, :tel, :purchase_id

  with_options presence: true do
  # バリデーションの記述
  validates :user_id
  validates :item_id
  validates :postcode
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city
  validates :street
  validates :tel
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, building: building, tel: tel, purchase_id: purchase.id)
  end
end