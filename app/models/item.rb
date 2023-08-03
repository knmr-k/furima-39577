class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  # has_one :order

  # ActiveHash
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

  # ActiveStorage
  has_one_attached :image

  with_options presence: true do
    validates :name
    # validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :price, numericality: { only_integer: true, in: 300..9999999 }
    validates :info
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :shipping_date_id
    end
    validates :image
  end

end
