class Address < ApplicationRecord
	belongs_to :user
	validates_presence_of :name,:details,:street,:landmark,:state,:pincode,:city,:user_id
	validates_numericality_of :pincode
end
