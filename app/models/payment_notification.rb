# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer          not null, primary key
#  params         :text
#  status         :string(255)
#  transaction_id :string(255)
#  cart_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  order_id       :integer
#

class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  belongs_to :order
  serialize :params
  after_create :mark_cart_as_purchased
  
private
  def mark_cart_as_purchased
    	if status == "Completed"
      	cart.update_attributes(:purchased_at => Time.now)
      	order= Order.last
      	order.update_attributes(:purchased_at => Time.now)
  	end
   end
end
