class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :phone
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
