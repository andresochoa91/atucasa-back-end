class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :site_name
      t.string :url
      t.integer :merchant_id

      t.timestamps
    end
    add_index :links, :merchant_id
  end
end
