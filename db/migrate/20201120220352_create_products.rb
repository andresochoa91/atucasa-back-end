class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.integer :price
      t.boolean :available
      t.string :product_picture
      t.integer :merchant_id

      t.timestamps
    end
    add_index :products, :merchant_id
  end
end
