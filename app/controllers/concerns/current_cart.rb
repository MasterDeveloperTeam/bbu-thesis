module CurrentCart
	extend ActiveSupport::Concern
	def set_cart
		@cart = Cart.find(session[:cart_id])
		session[:cart_id] = nil if @cart.purchased_at != nil 
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
		
	end
end