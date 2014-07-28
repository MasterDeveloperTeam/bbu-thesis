class RemoveUserIdFromPaymentNotification < ActiveRecord::Migration
  def change
    remove_column :payment_notifications, :user_id, :integer
  end
end
