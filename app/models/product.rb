class Product < ActiveRecord::Base
	validates_presence_of :title, :description, :price
	validates :price, numericality: {greather_than_or_equal_to: 0.01}
	validates_uniqueness_of :title
	validates :image_url, allow_blank: true,format: {
		with: %r{\.(jpg|gif|png)\Z}i,
		message: "have to be a valid image with .gif .jpg .png"
	}
end
