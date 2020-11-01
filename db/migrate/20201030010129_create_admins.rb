class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :user_id

      t.timestamps
    end
    add_index :admins, :user_id
  end
end
