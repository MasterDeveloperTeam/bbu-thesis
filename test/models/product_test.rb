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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
