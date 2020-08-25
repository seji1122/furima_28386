class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :shipping_days_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :item_condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  belongs_to :user
  has_one_attached :image
end
