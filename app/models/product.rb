class Product < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	before_destroy :ensure_not_referenced_with_any_line_items, :check_user
	validates_presence_of :title, :description, :price
	validates :price, numericality: {greather_than_or_equal_to: 0.01}
	validates_uniqueness_of :title
	validates :image_url, allow_blank: true,format: {
		with: %r{\.(jpg|gif|png)\Z}i,
		message: "have to be a valid image with .gif .jpg .png"
	}


	def ensure_not_referenced_with_any_line_items
		if line_items.empty?
			return true
		else
			errors.add(:base, "Line item is present!")
			return false
		end
		
	end

	def check_user
		current_user = current_user.find_by(product_id: @product)
		if current_user
			return true 
		else
			errors.add(:base, notice: "you can not delete other post");
			return false 
		end
		
	end

	
end
