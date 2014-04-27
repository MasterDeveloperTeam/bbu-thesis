class Product < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	before_destroy :ensure_not_referenced_with_any_line_items
	validates_presence_of :title, :description, :price
	validates :price, numericality: {greather_than_or_equal_to: 0.01}
	validates_uniqueness_of :title
	has_attached_file 	:pdf,
				:url => "/assets/products/:id/:style/:basename.:extension",
  				:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
	validates :image_url, allow_blank: true,format: {
		with: %r{\.(jpg|gif|png)\Z}i,
		message: "have to be a valid image with .gif .jpg .png"
	}
	validates_attachment_content_type :pdf,
						      :content_type => [ 'application/pdf' ],
						      :message => "only pdf files are allowed"

	def ensure_not_referenced_with_any_line_items
		if line_items.empty?
			return true
		else
			errors.add(:base, "Line item is present!")
			return false
		end
		
	end

	def self.latest
		Product.order(:updated_at).last
	end

	
end
