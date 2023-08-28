class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :street, :building, :tel, :purchase_id

  with_options presence: true do
  validates :postcode,format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city
  validates :street
  validates :tel, format: { with: /\A\d{10,11}\z/}
  end

  attr_accessor :token
  validates :token, presence: true


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, building: building, tel: tel, purchase_id: purchase.id)
  end
end