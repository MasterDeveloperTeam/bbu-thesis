class UserProfileController < ApplicationController
	include CurrentCart
before_action :authenticate_user!, :unless => proc  {|c| c.devise_controller?}
  def index

  end
end
