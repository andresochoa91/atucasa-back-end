class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :user_id

      t.timestamps
    end
    add_index :merchants, :user_id
  end
end
