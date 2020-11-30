class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :merchant_name
      t.string :slug
      t.string :phone_number
      t.string :legal_id
      t.text :location
      t.text :description
      t.text :profile_picture
      t.text :background_picture
      t.integer :user_id

      t.timestamps
    end
    add_index :merchants, :user_id
  end
end
