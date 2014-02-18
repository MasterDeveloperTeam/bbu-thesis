class RemoveUserFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :user, index: true
  end
end
