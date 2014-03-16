class StoreController < ApplicationController
	include CurrentCart
	before_action :set_cart
  def index
  	@products = Product.order('created_at DESC').paginate(:page => params[:page], :per_page => 6)
  	@first_product = Product.order('created_at DESC').paginate(:page => params[:page], :per_page => 1)
  end
  def show
  	@product = Product.find(params[:product_id])
  end
end
