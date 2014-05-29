class AddAttachmentPhotoToFreeEbooks < ActiveRecord::Migration
  def self.up
    change_table :free_ebooks do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :free_ebooks, :photo
  end
end
