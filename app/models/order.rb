# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  purchased_at :datetime
#  company      :string(255)
#  city         :string(255)
#  zipcode      :string(255)
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :dependent => :destroy
  has_many :payment_notifications, :dependent => :destroy
  validates_presence_of :name, :address
  	def add_line_items_from_cart(cart)
  		cart.line_items.each do |item|
  			line_items << item
  		end
  	end
  	

  	
end
