class Product < ApplicationRecord
  has_many :order_items

  validates :price, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0}
end
