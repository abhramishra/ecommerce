class OrderLineItem < ApplicationRecord
	belongs_to :product
	belongs_to :order

	validates_presence_of :price,:product_id,:order_id,:quantity
end
