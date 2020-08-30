class Order < ApplicationRecord
  belongs_to :purchase

  # with_options presence: true do
  #   validates :post_coad, format: {with: /\A\d{3}[-]\d{4}\z/}
  #   validates :prefecture
  #    validates :city
  #    validates :banchi
  #    validates :phone_num
  #    validates :price
  # end
end
