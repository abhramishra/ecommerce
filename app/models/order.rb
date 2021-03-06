class Order < ApplicationRecord
	has_many :order_line_items
	belongs_to :user
	belongs_to :address

	validates_presence_of :order_number,:order_date,:user_id,:address_id,:total

	before_validation :set_number_date_total
	after_create :move_to_order_line_items
	after_create :empty_cart_line_items
	after_create :update_stock
	after_create :send_notification

	def set_number_date_total
		self.order_number = "Kloc#{Random.rand(1000)}"
		self.order_date = Date.today
		self.total = calculate_total

	end

	def calculate_total
		total = 0
		self.user.cart_line_items.each do |order_items|
			total += order_items.quantity * order_items.product.price
		end
		return total
	end

	def move_to_order_line_items
		self.user.cart_line_items.each do |line_item|
			OrderLineItem.create(product_id: line_item.product_id, quantity: line_item.quantity, price: line_item.product.price, order_id: self.id)

		end
	end

	def empty_cart_line_items
		self.user.cart_line_items.each do |line_item|
			line_item.destroy
		end
	end

	def update_stock
		self.order_line_items.each do |line_item|
			line_item.product.update_attributes(stock: line_item.product.stock - line_item.quantity)
		end
	end

	def send_notification
		NotificationMailer.order_confirmation(self).deliver!
	end
end
