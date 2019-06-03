class Review < ApplicationRecord
	belongs_to :product
	validates_presence_of :body,:rating

end
