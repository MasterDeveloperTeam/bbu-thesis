class UserProfileController < ApplicationController
include CurrentCart
before_action :authenticate_user!, :unless => proc  {|c| c.devise_controller?}
before_action :set_cart
  def index
  	@user = current_user
  end
end
