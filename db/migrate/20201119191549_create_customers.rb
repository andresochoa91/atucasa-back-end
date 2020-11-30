class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :slug
      t.string :phone_number
      t.text :location
      t.text :profile_picture
      t.integer :user_id

      t.timestamps
    end
    add_index :customers, :user_id
  end
end
