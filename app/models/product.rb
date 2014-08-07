# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  description      :text
#  image_url        :string(255)
#  price            :decimal(8, 2)
#  user_log_id      :integer
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#  category_id      :integer
#

class Product < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	belongs_to :category
	before_destroy :ensure_not_referenced_with_any_line_items
	validates_presence_of :title, :description, :price
	validates :price, numericality: {greather_than_or_equal_to: 0.01}
	validates_uniqueness_of :title
	has_attached_file 	:pdf,
				:url => "/assets/products/:id/:style/:basename.:extension",
  				:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
	
	validates_attachment_content_type :pdf,
						      :content_type => [ 'application/pdf' ],
						      :message => "only pdf files are allowed"

	scope :of_cate, lambda { |cate_id|
		where (["category_id = ?", cate_id])
	}
					      
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
