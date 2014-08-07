# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  purchased_at :datetime
#  company      :string(255)
#  city         :string(255)
#  zipcode      :string(255)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
