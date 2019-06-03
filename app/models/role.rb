class Role < ApplicationRecord
	has_many :permissions
	has_many :roles, through: :permissions
	validates_presence_of :name
end
