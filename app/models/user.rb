class User < ApplicationRecord
  has_many :addresses
  has_many :orders
  has_many :cart_line_items
  has_many :permissions
  has_many :roles, through: :permissions
  validates_presence_of :username,:mobile
  validates_numericality_of :mobile
  validates_length_of :mobile,is: 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #callback
  after_create :assign_customer_role

  #after_create :welcome_user_notification

  def assign_customer_role
  	Permission.create(user_id: self.id, role_id: Role.last.id)
  end

  def role?(role)
  	self.roles.pluck(:name).include?(role)
  end

  #def welcome_user_notification
  #  NotificationMailer.welcome_email(self).deliver!
  #end
end
