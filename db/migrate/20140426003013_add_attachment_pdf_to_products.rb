class AddAttachmentPdfToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :products, :pdf
  end
end
