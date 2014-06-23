class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products
  has_many :orders
  has_many :free_ebooks
  has_many :carts
  has_many :payment_notifications
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   def add_user(user_id, cart_id)
		current_cart = carts.find_by(cart_id)
		current_cart= carts.build[user_id: user_id]
	end
end
