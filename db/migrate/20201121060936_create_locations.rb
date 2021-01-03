class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.integer :zip_code
      t.text :details
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end
    add_index :locations, :user_id
  end
end
