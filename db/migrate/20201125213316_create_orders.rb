class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :merchant_id
      t.boolean :accepted
      t.boolean :canceled
      t.string :current_user
      t.float :tip
      t.float :delivery_fee

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :merchant_id
  end
end
