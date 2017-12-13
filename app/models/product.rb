class Product < ApplicationRecord
  has_many :order_items

  validates :price, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0}
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :image
end
