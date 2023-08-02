class Item < ApplicationRecord
  belongs_to :user
  # has_one :order

  validates :name, presence: true
  validates :price, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
end
