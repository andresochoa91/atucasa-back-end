class AddUserToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :location_id, :integer
    add_index :locations, :location_id
  end
end
