class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  has_many :line_items, :dependent => :destroy
  validates_presence_of :name, :address
  	def add_cart_to_order(cart)
  		Order.build(cart_id: cart)
  	end
  	
end
