class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :slug
      t.integer :phone_number
      t.text :location
      t.integer :user_id

      t.timestamps
    end
    add_index :customers, :user_id
  end
end
