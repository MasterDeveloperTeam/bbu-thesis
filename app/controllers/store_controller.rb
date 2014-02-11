class StoreController < ApplicationController
	include CurrentCart
	before_action :set_cart
  def index
  	@products = Product.order(:title).paginate(:page => params[:page], :per_page => 3)
  end
  def show
  	@product = Product.find(params[:product_id])
  end
end
