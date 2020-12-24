class CreateProductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :product_orders do |t|
      t.integer :product_id
      t.integer :order_id
      t.string :product_name
      t.float :price
      t.float :tax
      t.integer :amount
      t.boolean :available
      t.boolean :amount_changed

      t.timestamps
    end
    add_index :product_orders, :product_id
    add_index :product_orders, :order_id
  end
end
