class CreateFreeEbooks < ActiveRecord::Migration
  def change
    create_table :free_ebooks do |t|
      t.string :title
      t.text :description
      t.string :status, default: "Free"
      t.references :user, index: true

      t.timestamps
    end
  end
end
