class UserProfileController < ApplicationController
include CurrentCart
before_action :authenticate_user!, :unless => proc  {|c| c.devise_controller?}
before_action :set_cart
  def index
  	@users = Cart.find_by_id(params[:current_user])
  	
  end
end
