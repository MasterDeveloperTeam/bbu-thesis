class StoreController < ApplicationController
  def index
  	@products = Product.order(:title).paginate(:page => params[:page], :per_page => 3)
  end
  def show
  	@product = Product.find(params[:product_id])
  end
end
