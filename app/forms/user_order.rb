class UserOrder

  include ActiveModel::Model
  attr_accessor :token, :post_coad, :shipping_area_id, :city, :banchi, :building_num, :phone_num, :item_id, :user_id, :prefecture

  with_options presence: true do
    validates :token
    validates :post_coad, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :banchi
    validates :building_num
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }, allow_blank: true
    validates :item_id
  end
  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Order.create(post_coad: post_coad, city: city, banchi: banchi, phone_num: phone_num, purchase_id: purchase.id)
  end
end