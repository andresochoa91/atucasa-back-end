class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :location

      t.timestamps
    end
  end
end
