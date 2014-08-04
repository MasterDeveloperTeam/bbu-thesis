class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  before_action :set_category
  before_action :configure_permitted_parameters, if: :devise_controller?
  def set_category
  	  cate = params[:id]
    	if cate 
      	@products = Product.of_cate(cate).paginate(:page => params[:page], :per_page => 8)
    	else
  	@products = Product.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
  	end
  	@first_product = Product.order(created_at: :desc).paginate(:page => params[:page], :per_page => 1)
  	@categories = Category.all
  end
  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :username	
  end
end
