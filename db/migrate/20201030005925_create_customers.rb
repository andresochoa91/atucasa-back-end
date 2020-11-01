class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id

      t.timestamps
    end
    add_index :customers, :user_id
  end
end
