class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  
  # ActiveHash
  belongs_to :prefecture
end
