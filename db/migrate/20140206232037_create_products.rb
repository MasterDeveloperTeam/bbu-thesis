class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2 
      t.references :user_log, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
